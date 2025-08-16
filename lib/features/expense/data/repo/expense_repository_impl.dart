import 'dart:developer' as dev;
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/features/expense/data/data_sources/expense_local_data_source.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/category_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@LazySingleton(as: ExpenseRepository)
class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseLocalDataSource local;
  ExpenseRepositoryImpl(this.local);

  Database get _db => local.db;

  @override
  Future<List<AccountEntity>> getAccounts({required String uid}) async {
    dev.log('[ExpenseRepo] getAccounts uid=$uid');
    final rows = await _db.query('accounts', where: 'uid = ?', whereArgs: [uid]);
    return rows.map(_mapAccountRowToEntity).toList();
  }

  @override
  Future<void> addAccount({required AccountEntity account}) async {
    dev.log('[ExpenseRepo] addAccount name=${account.name}');
    await _db.insert('accounts', _accountEntityToRow(account));
  }

  @override
  Future<void> updateAccount({required AccountEntity account}) async {
    dev.log('[ExpenseRepo] updateAccount id=${account.accountId}');
    await _db.update('accounts', _accountEntityToRow(account), where: 'account_id = ?', whereArgs: [account.accountId]);
  }

  @override
  Future<List<CategoryEntity>> getCategories({required String uid}) async {
    dev.log('[ExpenseRepo] getCategories uid=$uid');
    final rows = await _db.query('categories', where: 'uid = ?', whereArgs: [uid]);
    return rows.map(_mapCategoryRowToEntity).toList();
  }

  @override
  Future<void> addCategory({required CategoryEntity category}) async {
    dev.log('[ExpenseRepo] addCategory name=${category.name} type=${category.type}');
    await _db.insert('categories', _categoryEntityToRow(category));
  }

  @override
  Future<void> updateCategory({required CategoryEntity category}) async {
    dev.log('[ExpenseRepo] updateCategory id=${category.categoryId}');
    await _db.update('categories', _categoryEntityToRow(category), where: 'category_id = ?', whereArgs: [category.categoryId]);
  }

  @override
  Future<List<TransactionEntity>> getTransactions({required String uid, DateTime? from, DateTime? to}) async {
    dev.log('[ExpenseRepo] getTransactions uid=$uid from=$from to=$to');
    final where = StringBuffer('uid = ?');
    final args = <Object?>[uid];
    if (from != null) {
      where.write(' AND occurred_on >= ?');
      args.add(_fmt(from));
    }
    if (to != null) {
      where.write(' AND occurred_on <= ?');
      args.add(_fmt(to));
    }
    final rows = await _db.query('transactions', where: where.toString(), whereArgs: args);
    return rows.map(_mapTransactionRowToEntity).toList();
  }

  @override
  Future<void> addTransaction({required TransactionEntity transaction}) async {
    dev.log('[ExpenseRepo] addTransaction amount=${transaction.amount} type=${transaction.type}');
    await _db.insert('transactions', _transactionEntityToRow(transaction));
  }

  @override
  Future<void> updateTransaction({required TransactionEntity transaction}) async {
    dev.log('[ExpenseRepo] updateTransaction id=${transaction.transactionId}');
    await _db.update('transactions', _transactionEntityToRow(transaction), where: 'transaction_id = ?', whereArgs: [transaction.transactionId]);
  }

  String _fmt(DateTime d) {
    final mm = d.month.toString().padLeft(2, '0');
    final dd = d.day.toString().padLeft(2, '0');
    return '${d.year}-$mm-$dd';
  }

  // --- Mapping helpers ---
  AccountEntity _mapAccountRowToEntity(Map<String, Object?> row) {
    final typeStr = (row['type'] as String?) ?? 'OTHER';
    final type = switch (typeStr.toUpperCase()) {
      'CASH' => AccountType.cash,
      'BANK' => AccountType.bank,
      'CARD' => AccountType.card,
      'EWALLET' => AccountType.ewallet,
      _ => AccountType.other,
    };
    DateTime parseDt(Object? v) => DateTime.tryParse((v as String?) ?? '') ?? DateTime.now();
    return AccountEntity(
      accountId: row['account_id'] as int?,
      uid: (row['uid'] as String?) ?? '',
      name: (row['name'] as String?) ?? '',
      type: type,
      currency: (row['currency'] as String?) ?? 'USD',
      isArchived: ((row['is_archived'] as int?) ?? 0) == 1,
      isDefault: ((row['is_default'] as int?) ?? 0) == 1,
      createdAt: parseDt(row['created_at']),
      updatedAt: DateTime.tryParse((row['updated_at'] as String?) ?? ''),
    );
  }

  Map<String, Object?> _accountEntityToRow(AccountEntity a) {
    String typeStr = switch (a.type) {
      AccountType.cash => 'CASH',
      AccountType.bank => 'BANK',
      AccountType.card => 'CARD',
      AccountType.ewallet => 'EWALLET',
      AccountType.other => 'OTHER',
    };
    return {
      'uid': a.uid,
      'name': a.name,
      'type': typeStr,
      'currency': a.currency,
      'is_archived': a.isArchived ? 1 : 0,
      'is_default': a.isDefault ? 1 : 0,
      'created_at': a.createdAt.toIso8601String(),
      if (a.updatedAt != null) 'updated_at': a.updatedAt?.toIso8601String(),
    };
  }

  CategoryEntity _mapCategoryRowToEntity(Map<String, Object?> row) {
    final typeStr = (row['type'] as String?) ?? 'EXPENSE';
    final type = typeStr.toUpperCase() == 'INCOME' ? CategoryType.income : CategoryType.expense;
    return CategoryEntity(
      categoryId: row['category_id'] as int?,
      uid: (row['uid'] as String?) ?? '',
      name: (row['name'] as String?) ?? '',
      type: type,
      parentId: row['parent_id'] as int?,
      icon: row['icon'] as String?,
      sortOrder: (row['sort_order'] as int?) ?? 0,
    );
  }

  Map<String, Object?> _categoryEntityToRow(CategoryEntity c) {
    final typeStr = c.type == CategoryType.income ? 'INCOME' : 'EXPENSE';
    return {
      'uid': c.uid,
      'name': c.name,
      'type': typeStr,
      'parent_id': c.parentId,
      'icon': c.icon,
      'sort_order': c.sortOrder,
    };
  }

  TransactionEntity _mapTransactionRowToEntity(Map<String, Object?> row) {
    final typeStr = (row['type'] as String?) ?? 'EXPENSE';
    final type = switch (typeStr.toUpperCase()) {
      'INCOME' => TransactionType.income,
      'TRANSFER' => TransactionType.transfer,
      _ => TransactionType.expense,
    };
    DateTime parseDt(Object? v) => DateTime.tryParse((v as String?) ?? '') ?? DateTime.now();
    return TransactionEntity(
      transactionId: row['transaction_id'] as int?,
      uid: (row['uid'] as String?) ?? '',
      accountId: (row['account_id'] as int?) ?? 0,
      type: type,
      amount: ((row['amount'] as num?) ?? 0).toDouble(),
      currency: (row['currency'] as String?) ?? 'USD',
      categoryId: row['category_id'] as int?,
      payeeId: row['payee_id'] as int?,
      note: row['note'] as String?,
      occurredOn: parseDt(row['occurred_on']),
      occurredAt: DateTime.tryParse((row['occurred_at'] as String?) ?? ''),
      transferGroupId: row['transfer_group_id'] as String?,
      hasSplit: ((row['has_split'] as int?) ?? 0) == 1,
      createdAt: parseDt(row['created_at']),
      updatedAt: DateTime.tryParse((row['updated_at'] as String?) ?? ''),
    );
  }

  Map<String, Object?> _transactionEntityToRow(TransactionEntity t) {
    final typeStr = switch (t.type) {
      TransactionType.income => 'INCOME',
      TransactionType.transfer => 'TRANSFER',
      TransactionType.expense => 'EXPENSE',
    };
    return {
      'uid': t.uid,
      'account_id': t.accountId,
      'type': typeStr,
      'amount': t.amount,
      'currency': t.currency,
      'category_id': t.categoryId,
      'payee_id': t.payeeId,
      'note': t.note,
      'occurred_on': _fmt(t.occurredOn),
      'occurred_at': t.occurredAt?.toIso8601String(),
      'transfer_group_id': t.transferGroupId,
      'has_split': t.hasSplit ? 1 : 0,
      'created_at': t.createdAt.toIso8601String(),
      'updated_at': t.updatedAt?.toIso8601String(),
    };
  }
}


