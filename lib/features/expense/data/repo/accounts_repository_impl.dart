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
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
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

  @override
  Future<Either<Failure, AccountDetailsSummary>> getAccountDetailsSummary({
    required String uid,
    required int accountId,
  }) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Getting account details summary: $accountId', tag: 'AccountsRepo');
      
      // Get account details
      final accountResult = await _db.query(
        'accounts',
        where: 'account_id = ? AND uid = ?',
        whereArgs: [accountId, uid],
      );
      
      if (accountResult.isEmpty) {
        return EitherUtils.left(
          AccountFailure(
            'Account not found',
            accountId: accountId.toString(),
            code: 'account_not_found',
          ),
        );
      }
      
      final account = _accountModelToEntity(AccountModel.fromJson(accountResult.first));
      
      // Get transactions for this account
      final transactionsResult = await _db.query(
        'transactions',
        where: 'account_id = ? AND uid = ?',
        whereArgs: [accountId, uid],
        orderBy: 'occurred_on DESC',
      );
      
      final transactions = transactionsResult.map((row) {
        // Convert raw transaction data to TransactionEntity
        // This is a simplified conversion - you may need to adjust based on your actual transaction model
        return TransactionEntity(
          transactionId: row['transaction_id'] as int?,
          uid: row['uid'] as String,
          accountId: row['account_id'] as int,
          type: _parseTransactionType(row['type'] as String),
          amount: (row['amount'] as num).toDouble(),
          currency: row['currency'] as String,
          categoryId: row['category_id'] as int?,
          payeeId: row['payee_id'] as int?,
          note: row['note'] as String?,
          occurredOn: DateTime.parse(row['occurred_on'] as String),
          occurredAt: row['occurred_at'] != null ? DateTime.parse(row['occurred_at'] as String) : null,
          transferGroupId: row['transfer_group_id'] as String?,
          hasSplit: (row['has_split'] as int?) == 1,
          createdAt: DateTime.parse(row['created_at'] as String),
          updatedAt: row['updated_at'] != null ? DateTime.parse(row['updated_at'] as String) : null,
        );
      }).toList();
      
      // Calculate balance info
      final balanceInfo = await _calculateAccountBalanceInfo(uid, accountId, transactions);
      
      // Calculate current balance (starting balance + net amount)
      final currentBalance = 0.0 + balanceInfo.netAmount; // You might want to store starting balance in accounts table
      
      final summary = AccountDetailsSummary(
        account: account,
        transactions: transactions,
        balance: currentBalance,
        balanceInfo: balanceInfo,
      );
      
      stopwatch.stop();
      logger.logSuccess(
        'Get account details summary',
        userId: uid,
        context: {'accountId': accountId, 'transactionCount': transactions.length},
      );
      logger.logPerformance(
        'Get account details summary',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(summary);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to get account details summary',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getAccountDetailsSummary',
        userId: uid,
        context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to get account details summary',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>> getAccountTransactions({
    required String uid,
    required int accountId,
    DateTime? fromDate,
    DateTime? toDate,
    TransactionType? transactionType,
  }) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Getting account transactions: $accountId', tag: 'AccountsRepo');
      
      String whereClause = 'account_id = ? AND uid = ?';
      List<dynamic> whereArgs = [accountId, uid];
      
      // Add date filters
      if (fromDate != null) {
        whereClause += ' AND occurred_on >= ?';
        whereArgs.add(fromDate.toIso8601String());
      }
      
      if (toDate != null) {
        whereClause += ' AND occurred_on <= ?';
        whereArgs.add(toDate.toIso8601String());
      }
      
      // Add transaction type filter
      if (transactionType != null) {
        whereClause += ' AND type = ?';
        whereArgs.add(_transactionTypeToString(transactionType));
      }
      
      final result = await _db.query(
        'transactions',
        where: whereClause,
        whereArgs: whereArgs,
        orderBy: 'occurred_on DESC',
      );
      
      final transactions = result.map((row) {
        return TransactionEntity(
          transactionId: row['transaction_id'] as int?,
          uid: row['uid'] as String,
          accountId: row['account_id'] as int,
          type: _parseTransactionType(row['type'] as String),
          amount: (row['amount'] as num).toDouble(),
          currency: row['currency'] as String,
          categoryId: row['category_id'] as int?,
          payeeId: row['payee_id'] as int?,
          note: row['note'] as String?,
          occurredOn: DateTime.parse(row['occurred_on'] as String),
          occurredAt: row['occurred_at'] != null ? DateTime.parse(row['occurred_at'] as String) : null,
          transferGroupId: row['transfer_group_id'] as String?,
          hasSplit: (row['has_split'] as int?) == 1,
          createdAt: DateTime.parse(row['created_at'] as String),
          updatedAt: row['updated_at'] != null ? DateTime.parse(row['updated_at'] as String) : null,
        );
      }).toList();
      
      stopwatch.stop();
      logger.logSuccess(
        'Get account transactions',
        userId: uid,
        context: {'accountId': accountId, 'transactionCount': transactions.length},
      );
      logger.logPerformance(
        'Get account transactions',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(transactions);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to get account transactions',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getAccountTransactions',
        userId: uid,
        context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to get account transactions',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, AccountBalanceInfo>> getAccountBalanceInfo({
    required String uid,
    required int accountId,
  }) async {
    final stopwatch = Stopwatch()..start();
    
    try {
      logger.info('Getting account balance info: $accountId', tag: 'AccountsRepo');
      
      final result = await _db.query(
        'transactions',
        where: 'account_id = ? AND uid = ?',
        whereArgs: [accountId, uid],
      );
      
      final balanceInfo = await _calculateAccountBalanceInfo(uid, accountId, result.map((row) {
        return TransactionEntity(
          transactionId: row['transaction_id'] as int?,
          uid: row['uid'] as String,
          accountId: row['account_id'] as int,
          type: _parseTransactionType(row['type'] as String),
          amount: (row['amount'] as num).toDouble(),
          currency: row['currency'] as String,
          categoryId: row['category_id'] as int?,
          payeeId: row['payee_id'] as int?,
          note: row['note'] as String?,
          occurredOn: DateTime.parse(row['occurred_on'] as String),
          occurredAt: row['occurred_at'] != null ? DateTime.parse(row['occurred_at'] as String) : null,
          transferGroupId: row['transfer_group_id'] as String?,
          hasSplit: (row['has_split'] as int?) == 1,
          createdAt: DateTime.parse(row['created_at'] as String),
          updatedAt: row['updated_at'] != null ? DateTime.parse(row['updated_at'] as String) : null,
        );
      }).toList());
      
      stopwatch.stop();
      logger.logSuccess(
        'Get account balance info',
        userId: uid,
        context: {'accountId': accountId},
      );
      logger.logPerformance(
        'Get account balance info',
        duration: stopwatch.elapsed,
        userId: uid,
      );
      
      return EitherUtils.right(balanceInfo);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to get account balance info',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getAccountBalanceInfo',
        userId: uid,
        context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds},
      );
      
      return EitherUtils.left(
        AccountFailure(
          'Failed to get account balance info',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  // Helper methods
  Future<AccountBalanceInfo> _calculateAccountBalanceInfo(
    String uid,
    int accountId,
    List<TransactionEntity> transactions,
  ) async {
    double totalIncoming = 0.0;
    double totalOutgoing = 0.0;
    int incomingCount = 0;
    int outgoingCount = 0;
    
    for (final transaction in transactions) {
      if (transaction.type == TransactionType.income) {
        totalIncoming += transaction.amount;
        incomingCount++;
      } else if (transaction.type == TransactionType.expense) {
        totalOutgoing += transaction.amount;
        outgoingCount++;
      }
    }
    
    final netAmount = totalIncoming - totalOutgoing;
    
    return AccountBalanceInfo(
      currentBalance: 0.0 + netAmount, // You might want to store starting balance
      totalIncoming: totalIncoming,
      totalOutgoing: totalOutgoing,
      netAmount: netAmount,
      totalTransactions: transactions.length,
      incomingCount: incomingCount,
      outgoingCount: outgoingCount,
    );
  }

  TransactionType _parseTransactionType(String type) {
    switch (type.toUpperCase()) {
      case 'INCOME':
        return TransactionType.income;
      case 'EXPENSE':
        return TransactionType.expense;
      case 'TRANSFER':
        return TransactionType.transfer;
      default:
        return TransactionType.expense;
    }
  }

  String _transactionTypeToString(TransactionType type) {
    switch (type) {
      case TransactionType.income:
        return 'INCOME';
      case TransactionType.expense:
        return 'EXPENSE';
      case TransactionType.transfer:
        return 'TRANSFER';
    }
  }
}


