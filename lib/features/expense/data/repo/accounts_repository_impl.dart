import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/failures/expense_failures.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/either_utils.dart';
import 'package:track/features/expense/data/data_sources/accounts_local_data_source.dart';
import 'package:track/features/expense/data/models/raw_models/account_model.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

@LazySingleton(as: AccountsRepository)
class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsLocalDataSource local;
  AccountsRepositoryImpl(this.local);

  Database get _db => local.db;

  // --- Mapping helpers ---
  AccountModel _accountEntityToModel(AccountEntity entity) {
    return AccountModel(
      accountId: entity.accountId,
      uid: entity.uid,
      name: entity.name,
      type: _mapAccountTypeToModel(entity.type),
      currency: entity.currency,
      isArchived: entity.isArchived,
      isDefault: entity.isDefault,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  AccountEntity _accountModelToEntity(AccountModel model) {
    return AccountEntity(
      accountId: model.accountId,
      uid: model.uid,
      name: model.name,
      type: _mapAccountTypeModelToEntity(model.type),
      currency: model.currency,
      isArchived: model.isArchived,
      isDefault: model.isDefault,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  AccountTypeModel _mapAccountTypeToModel(AccountType type) {
    switch (type) {
      case AccountType.cash:
        return AccountTypeModel.cash;
      case AccountType.bank:
        return AccountTypeModel.bank;
      case AccountType.card:
        return AccountTypeModel.card;
      case AccountType.ewallet:
        return AccountTypeModel.ewallet;
      case AccountType.other:
        return AccountTypeModel.other;
    }
  }

  AccountType _mapAccountTypeModelToEntity(AccountTypeModel typeModel) {
    switch (typeModel) {
      case AccountTypeModel.cash:
        return AccountType.cash;
      case AccountTypeModel.bank:
        return AccountType.bank;
      case AccountTypeModel.card:
        return AccountType.card;
      case AccountTypeModel.ewallet:
        return AccountType.ewallet;
      case AccountTypeModel.other:
        return AccountType.other;
    }
  }

  @override
  Future<Either<Failure, void>> addAccount({required AccountEntity account}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Adding account: ${account.name}', tag: 'AccountsRepo');
      
      // If this account is being set as default, first remove default from all other accounts
      if (account.isDefault) {
        await _db.update(
          'accounts',
          {'is_default': 0},
          where: 'uid = ?',
          whereArgs: [account.uid],
        );
      }
      
      final accountModel = _accountEntityToModel(account);
      await _db.insert('accounts', accountModel.toJson());
      
      stopwatch.stop();
      logger.logSuccess(
        'Add account',
        userId: account.uid,
        context: {'accountName': account.name, 'accountType': account.type.toString()},
      );
      logger.logPerformance(
        'Add account',
        duration: stopwatch.elapsed,
        userId: account.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to add account: ${account.name}',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'addAccount',
        userId: account.uid,
        context: {'accountName': account.name, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to add account',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccounts({required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Fetching accounts for user: $uid', tag: 'AccountsRepo');
      
      final rows = await _db.query('accounts', where: 'uid = ?', whereArgs: [uid]);
      final accounts = rows.map((r) => _accountModelToEntity(AccountModel.fromJson(r))).toList();
      
      stopwatch.stop();
      logger.logSuccess(
        'Get accounts',
        userId: uid,
        context: {'accountCount': accounts.length},
      );
      logger.logPerformance(
        'Get accounts',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      logger.logDatabaseOperation(
        'SELECT',
        table: 'accounts',
        userId: uid,
        duration: stopwatch.elapsed,
      );
      
      return EitherUtils.right(accounts);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to fetch accounts',
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getAccounts',
        userId: uid,
        context: {'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to fetch accounts',
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateAccount({required AccountEntity account}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Updating account: ${account.name}', tag: 'AccountsRepo');
      
      // If this account is being set as default, first remove default from all other accounts
      if (account.isDefault) {
        await _db.update(
          'accounts',
          {'is_default': 0},
          where: 'uid = ? AND account_id != ?',
          whereArgs: [account.uid, account.accountId],
        );
      }
      
      final accountModel = _accountEntityToModel(account);
      await _db.update(
        'accounts',
        accountModel.toJson(),
        where: 'account_id = ?',
        whereArgs: [account.accountId],
      );
      
      stopwatch.stop();
      logger.logSuccess(
        'Update account',
        userId: account.uid,
        context: {'accountId': account.accountId, 'accountName': account.name},
      );
      logger.logPerformance(
        'Update account',
        duration: stopwatch.elapsed,
        userId: account.uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to update account: ${account.name}',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'updateAccount',
        userId: account.uid,
        context: {'accountId': account.accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to update account',
          accountId: account.accountId?.toString(),
          accountName: account.name,
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteAccount({required int accountId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Deleting account: $accountId', tag: 'AccountsRepo');
      
      await _db.delete(
        'accounts',
        where: 'account_id = ? AND uid = ?',
        whereArgs: [accountId, uid],
      );
      
      stopwatch.stop();
      logger.logSuccess(
        'Delete account',
        userId: uid,
        context: {'accountId': accountId},
      );
      logger.logPerformance(
        'Delete account',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to delete account',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'deleteAccount',
        userId: uid,
        context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to delete account',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> setDefaultAccount({required int accountId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Setting default account: $accountId', tag: 'AccountsRepo');
      
      // First, check if this account exists
      final currentAccountRows = await _db.query(
        'accounts',
        where: 'account_id = ? AND uid = ?',
        whereArgs: [accountId, uid],
      );
      
      if (currentAccountRows.isEmpty) {
        stopwatch.stop();
        logger.logFailure(
          NotFoundFailure('Account not found'),
          operation: 'setDefaultAccount',
          userId: uid,
          context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
        );
        
        return EitherUtils.left(
          NotFoundFailure('Account not found'),
        );
      }
      
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
      
      stopwatch.stop();
      logger.logSuccess(
        'Set default account',
        userId: uid,
        context: {'accountId': accountId},
      );
      logger.logPerformance(
        'Set default account',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(null);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to set default account',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'setDefaultAccount',
        userId: uid,
        context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to set default account',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isAccountInUse({required int accountId, required String uid}) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Checking if account is in use: $accountId', tag: 'AccountsRepo');
      
      final result = await _db.query(
        'transactions',
        where: 'account_id = ? AND uid = ?',
        whereArgs: [accountId, uid],
        limit: 1,
      );
      
      final isInUse = result.isNotEmpty;
      stopwatch.stop();
      
      logger.logSuccess(
        'Check account in use',
        userId: uid,
        context: {'accountId': accountId, 'isInUse': isInUse},
      );
      logger.logPerformance(
        'Check account in use',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(isInUse);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to check if account is in use',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'isAccountInUse',
        userId: uid,
        context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to check if account is in use',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}


