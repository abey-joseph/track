import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/failures/expense_failures.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/either_utils.dart';
import 'package:track/features/expense/data/models/raw_models/account_model.dart';
import 'package:track/features/expense/domain/entities/raw_entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';
import 'package:track/features/expense/data/repo/helper_methods/account_repo_helpers.dart';
import 'package:track/features/expense/data/models/mapping_helpers/account_mappers.dart';
import 'package:track/features/expense/data/data_sources/expense_local_data_source.dart';

@LazySingleton(as: AccountsRepository)
class AccountsRepositoryImpl implements AccountsRepository {
  final ExpenseLocalDataSource local;
  final AccountMappers accountMappers;
  AccountsRepositoryImpl(this.local, this.accountMappers);

  Database get _db => local.db;

  @override
  Future<Either<Failure, void>> addAccount(
      {required AccountEntity account}) async {
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

      final accountModel = accountMappers.accountEntityToModel(account);
      await _db.insert('accounts', accountModel.toJson());

      stopwatch.stop();
      logger.logSuccess(
        'Add account',
        userId: account.uid,
        context: {
          'accountName': account.name,
          'accountType': account.type.toString()
        },
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
        context: {
          'accountName': account.name,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
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
  Future<Either<Failure, List<AccountEntity>>> getAccounts(
      {required String uid}) async {
    final stopwatch = Stopwatch()..start();

    try {
      logger.info('Fetching accounts for user: $uid', tag: 'AccountsRepo');

      final rows =
          await _db.query('accounts', where: 'uid = ?', whereArgs: [uid]);
      final accounts = rows
          .map((r) =>
              accountMappers.accountModelToEntity(AccountModel.fromJson(r)))
          .toList();

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
  Future<Either<Failure, AccountEntity>> getAccount(
      {required String uid, required int accountId}) async {
    final stopwatch = Stopwatch()..start();

    try {
      logger.info('Fetching account: $accountId for user: $uid',
          tag: 'AccountsRepo');

      final result = await _db.query(
        'accounts',
        where: 'account_id = ? AND uid = ?',
        whereArgs: [accountId, uid],
      );

      if (result.isEmpty) {
        return EitherUtils.left(
          AccountFailure(
            'Account not found',
            accountId: accountId.toString(),
            code: 'account_not_found',
          ),
        );
      }

      final account = accountMappers
          .accountModelToEntity(AccountModel.fromJson(result.first));

      stopwatch.stop();
      logger.logSuccess(
        'Get account',
        userId: uid,
        context: {'accountId': accountId, 'accountName': account.name},
      );
      logger.logPerformance(
        'Get account',
        duration: stopwatch.elapsed,
        userId: uid,
      );

      return EitherUtils.right(account);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to fetch account',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getAccount',
        userId: uid,
        context: {
          'accountId': accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
      );

      return EitherUtils.left(
        AccountFailure(
          'Failed to fetch account',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateAccount(
      {required AccountEntity account}) async {
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

      final accountModel = accountMappers.accountEntityToModel(account);
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
        context: {
          'accountId': account.accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
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
  Future<Either<Failure, void>> deleteAccount(
      {required int accountId, required String uid}) async {
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
        context: {
          'accountId': accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
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
  Future<Either<Failure, void>> setDefaultAccount(
      {required int accountId, required String uid}) async {
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
          context: {
            'accountId': accountId,
            'durationMs': stopwatch.elapsed.inMilliseconds
          },
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
        context: {
          'accountId': accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
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
  Future<Either<Failure, bool>> isAccountInUse(
      {required int accountId, required String uid}) async {
    final stopwatch = Stopwatch()..start();

    try {
      logger.info('Checking if account is in use: $accountId',
          tag: 'AccountsRepo');

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
        context: {
          'accountId': accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
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
  Future<Either<Failure, List<TransactionEntity>>> getAccountTransactions({
    required String uid,
    required int accountId,
    DateTime? fromDate,
    DateTime? toDate,
    TransactionType? transactionType,
  }) async {
    final stopwatch = Stopwatch()..start();

    try {
      logger.info('Getting account transactions: $accountId',
          tag: 'AccountsRepo');

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

      // Preload currency minor factors from currencies table for all currencies present
      final Set<String> currenciesInResult = {
        for (final r in result)
          if (r['currency'] != null) (r['currency'] as String)
      };
      final Map<String, int> currencyFactors =
          await _loadCurrencyMinorFactors(currenciesInResult);

      final transactions = result.map((row) {
        return TransactionEntity(
          transactionId: row['transaction_id'] as int?,
          uid: row['uid'] as String,
          accountId: row['account_id'] as int,
          type: AccountRepoMappers.parseTransactionType(row['type'] as String),
          amount: _minorToDisplayWithFactor(
            row['amount_minor'],
            factor: currencyFactors[(row['currency'] as String?) ?? ''] ?? 100,
          ),
          currency: row['currency'] as String,
          categoryId: row['category_id'] as int?,
          payeeId: row['payee_id'] as int?,
          note: row['note'] as String?,
          occurredOn: DateTime.parse(row['occurred_on'] as String),
          occurredAt: row['occurred_at'] != null
              ? DateTime.parse(row['occurred_at'] as String)
              : null,
          transferGroupId: row['transfer_group_id'] as String?,
          hasSplit: (row['has_split'] as int?) == 1,
          createdAt: DateTime.parse(row['created_at'] as String),
          updatedAt: row['updated_at'] != null
              ? DateTime.parse(row['updated_at'] as String)
              : null,
        );
      }).toList();

      stopwatch.stop();
      logger.logSuccess(
        'Get account transactions',
        userId: uid,
        context: {
          'accountId': accountId,
          'transactionCount': transactions.length
        },
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
        context: {
          'accountId': accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
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
  Future<Either<Failure, double>> getAccountBalance({
    required String uid,
    required int accountId,
  }) async {
    final stopwatch = Stopwatch()..start();
    try {
      logger.info('Getting account balance (double only): $accountId',
          tag: 'AccountsRepo');

      // Query the running balance view for the latest balance for this account
      // We order by occurred_on and transaction_id descending to get the last row's running_balance
      final List<Map<String, Object?>> rows = await _db.rawQuery(
        'SELECT running_minor_balance FROM v_account_running_balance WHERE account_id = ? ORDER BY occurred_on DESC, transaction_id DESC LIMIT 1',
        [accountId],
      );

      final double balance;
      if (rows.isEmpty) {
        // No transactions yet; treat as zero balance for now
        balance = 0.0;
      } else {
        final value = rows.first['running_minor_balance'];
        final minor = (value is int)
            ? value
            : (value is num)
                ? value.toInt()
                : int.tryParse(value.toString()) ?? 0;
        // Need account currency to convert; fetch it quickly
        final accRows = await _db.query('accounts',
            columns: ['currency'],
            where: 'account_id = ?',
            whereArgs: [accountId],
            limit: 1);
        final currency =
            accRows.isNotEmpty ? (accRows.first['currency'] as String) : 'USD';
        final factorMap = await _loadCurrencyMinorFactors({currency});
        final factor = factorMap[currency] ?? 100;
        balance = _minorToDisplayWithFactor(minor, factor: factor);
      }

      stopwatch.stop();
      logger.logSuccess(
        'Get account balance (double)',
        userId: uid,
        context: {'accountId': accountId, 'balance': balance},
      );
      logger.logPerformance(
        'Get account balance (double)',
        duration: stopwatch.elapsed,
        userId: uid,
      );

      return EitherUtils.right(balance);
    } catch (e, stackTrace) {
      stopwatch.stop();
      logger.logFailure(
        AccountFailure(
          'Failed to get account balance',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
        operation: 'getAccountBalance',
        userId: uid,
        context: {
          'accountId': accountId,
          'durationMs': stopwatch.elapsed.inMilliseconds
        },
      );

      return EitherUtils.left(
        AccountFailure(
          'Failed to get account balance',
          accountId: accountId.toString(),
          cause: e,
          stackTrace: stackTrace,
        ),
      );
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

  Future<Map<String, int>> _loadCurrencyMinorFactors(Set<String> codes) async {
    if (codes.isEmpty) return {};
    final placeholders = List.filled(codes.length, '?').join(',');
    final rows = await _db.rawQuery(
      'SELECT code, minor_unit FROM currencies WHERE code IN ($placeholders)',
      codes.toList(),
    );
    final Map<String, int> map = {};
    for (final r in rows) {
      final code = r['code'] as String?;
      final mu = r['minor_unit'];
      if (code == null) continue;
      final digits = (mu is int) ? mu : int.tryParse(mu.toString()) ?? 2;
      int factor = 1;
      for (int i = 0; i < digits; i++) factor *= 10;
      map[code] = factor;
    }
    return map;
  }

  double _minorToDisplayWithFactor(Object? minorValue, {required int factor}) {
    final minor = (minorValue is int)
        ? minorValue
        : (minorValue is num)
            ? minorValue.toInt()
            : int.tryParse(minorValue?.toString() ?? '0') ?? 0;
    return minor / factor;
  }
}
