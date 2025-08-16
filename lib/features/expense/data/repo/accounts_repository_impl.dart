import 'dart:developer' as dev;
import 'package:injectable/injectable.dart';
import 'package:track/features/expense/data/data_sources/accounts_local_data_source.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';
import 'package:sqflite/sqflite.dart';

@LazySingleton(as: AccountsRepository)
class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsLocalDataSource local;
  AccountsRepositoryImpl(this.local);

  Database get _db => local.db;

  @override
  Future<void> addAccount({required AccountEntity account}) async {
    dev.log('[AccountsRepo] addAccount name=${account.name}');
    
    // If this account is being set as default, first remove default from all other accounts
    if (account.isDefault) {
      await _db.update(
        'accounts',
        {'is_default': 0},
        where: 'uid = ?',
        whereArgs: [account.uid],
      );
    }
    
    await _db.insert('accounts', {
      'uid': account.uid,
      'name': account.name,
      'type': switch (account.type) {
        AccountType.cash => 'CASH',
        AccountType.bank => 'BANK',
        AccountType.card => 'CARD',
        AccountType.ewallet => 'EWALLET',
        AccountType.other => 'OTHER',
      },
      'currency': account.currency,
      'is_archived': account.isArchived ? 1 : 0,
      'is_default': account.isDefault ? 1 : 0,
      'created_at': account.createdAt.toIso8601String(),
      'updated_at': account.updatedAt?.toIso8601String(),
    });
  }

  @override
  Future<List<AccountEntity>> getAccounts({required String uid}) async {
    dev.log('[AccountsRepo] getAccounts uid=$uid');
    final rows = await _db.query('accounts', where: 'uid = ?', whereArgs: [uid]);
    DateTime parseDt(Object? v) => DateTime.tryParse((v as String?) ?? '') ?? DateTime.now();
    AccountType parseType(String? s) {
      switch ((s ?? 'OTHER').toUpperCase()) {
        case 'CASH':
          return AccountType.cash;
        case 'BANK':
          return AccountType.bank;
        case 'CARD':
          return AccountType.card;
        case 'EWALLET':
          return AccountType.ewallet;
        default:
          return AccountType.other;
      }
    }
    return rows
        .map((r) => AccountEntity(
              accountId: r['account_id'] as int?,
              uid: (r['uid'] as String?) ?? '',
              name: (r['name'] as String?) ?? '',
              type: parseType(r['type'] as String?),
              currency: (r['currency'] as String?) ?? 'USD',
              isArchived: ((r['is_archived'] as int?) ?? 0) == 1,
              isDefault: ((r['is_default'] as int?) ?? 0) == 1,
              createdAt: parseDt(r['created_at']),
              updatedAt: DateTime.tryParse((r['updated_at'] as String?) ?? ''),
            ))
        .toList();
  }

  @override
  Future<void> updateAccount({required AccountEntity account}) async {
    dev.log('[AccountsRepo] updateAccount id=${account.accountId}');
    
    // If this account is being set as default, first remove default from all other accounts
    if (account.isDefault) {
      await _db.update(
        'accounts',
        {'is_default': 0},
        where: 'uid = ? AND account_id != ?',
        whereArgs: [account.uid, account.accountId],
      );
    }
    
    await _db.update(
      'accounts',
      {
        'uid': account.uid,
        'name': account.name,
        'type': switch (account.type) {
          AccountType.cash => 'CASH',
          AccountType.bank => 'BANK',
          AccountType.card => 'CARD',
          AccountType.ewallet => 'EWALLET',
          AccountType.other => 'OTHER',
        },
        'currency': account.currency,
        'is_archived': account.isArchived ? 1 : 0,
        'is_default': account.isDefault ? 1 : 0,
        'updated_at': account.updatedAt?.toIso8601String(),
      },
      where: 'account_id = ?',
      whereArgs: [account.accountId],
    );
  }

  @override
  Future<void> deleteAccount({required int accountId, required String uid}) async {
    dev.log('[AccountsRepo] deleteAccount id=$accountId');
    await _db.delete(
      'accounts',
      where: 'account_id = ? AND uid = ?',
      whereArgs: [accountId, uid],
    );
  }

  @override
  Future<void> setDefaultAccount({required int accountId, required String uid}) async {
    dev.log('[AccountsRepo] setDefaultAccount id=$accountId');
    
    // First, check if this account exists
    final currentAccount = await _db.query(
      'accounts',
      where: 'account_id = ? AND uid = ?',
      whereArgs: [accountId, uid],
    );
    
    if (currentAccount.isEmpty) return;
    
    // Always ensure only one default account by:
    // 1. First, remove default from ALL accounts for this user
    await _db.update(
      'accounts',
      {'is_default': 0},
      where: 'uid = ?',
      whereArgs: [uid],
    );
    
    // 2. Then set the specified account as default
    await _db.update(
      'accounts',
      {'is_default': 1},
      where: 'account_id = ? AND uid = ?',
      whereArgs: [accountId, uid],
    );
    
    dev.log('[AccountsRepo] Set account $accountId as default, removed default from all other accounts');
  }

  @override
  Future<bool> isAccountInUse({required int accountId, required String uid}) async {
    dev.log('[AccountsRepo] isAccountInUse id=$accountId');
    final result = await _db.query(
      'transactions',
      where: 'account_id = ? AND uid = ?',
      whereArgs: [accountId, uid],
      limit: 1,
    );
    return result.isNotEmpty;
  }
}


