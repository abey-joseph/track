import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/failures/expense_failures.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/either_utils.dart';
import 'package:track/features/expense/data/data_sources/expense_local_data_source.dart';
import 'package:track/features/expense/data/models/raw_models/transaction_model.dart';
import 'package:track/features/expense/domain/entities/account_entity.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/dashboard_repository.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final ExpenseLocalDataSource local;
  final AccountsRepository accountsRepository;

  DashboardRepositoryImpl(this.local, this.accountsRepository);

  Database get _db => local.db;

  // --- Mapping helpers ---
  TransactionEntity _transactionModelToEntity(TransactionModel model) {
    return TransactionEntity(
      transactionId: model.transactionId,
      uid: model.uid,
      accountId: model.accountId,
      type: _mapTransactionTypeModelToEntity(model.type),
      amount: model.amount,
      currency: model.currency,
      categoryId: model.categoryId,
      payeeId: model.payeeId,
      note: model.note,
      occurredOn: model.occurredOn,
      occurredAt: model.occurredAt,
      transferGroupId: model.transferGroupId,
      hasSplit: model.hasSplit,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  TransactionType _mapTransactionTypeModelToEntity(TransactionTypeModel model) {
    switch (model) {
      case TransactionTypeModel.expense:
        return TransactionType.expense;
      case TransactionTypeModel.income:
        return TransactionType.income;
      case TransactionTypeModel.transfer:
        return TransactionType.transfer;
    }
  }

  @override
  Future<Either<Failure, RecentTransactionsSummary>> getRecentTransactionsSummary({
    required String uid,
    required DateTime from,
    required DateTime to,
  }) async {
    final stopwatch = Stopwatch()..start();
    try {
      final where = StringBuffer('uid = ? AND occurred_on >= ? AND occurred_on <= ?');
      final args = <Object?>[uid, _fmt(from), _fmt(to)];

      final rows = await _db.query(
        'transactions',
        where: where.toString(),
        whereArgs: args,
        orderBy: 'occurred_on DESC',
      );
      final transactions = rows
          .map((r) => _transactionModelToEntity(TransactionModel.fromJson(r)))
          .toList();

      stopwatch.stop();
      logger.logSuccess('Dashboard recent summary', userId: uid, context: {
        'transactionCount': transactions.length,
        'durationMs': stopwatch.elapsed.inMilliseconds,
      });
      return EitherUtils.right(
        RecentTransactionsSummary(
          totalCount: transactions.length,
          transactions: transactions,
        ),
      );
    } catch (e, st) {
      stopwatch.stop();
      return EitherUtils.left(TransactionFailure('Failed to load recent summary', cause: e, stackTrace: st));
    }
  }

  @override
  Future<Either<Failure, AccountDetailsSummary>> getAccountDetailsSummary({
    required String uid,
    int? accountId,

  }) async {
    final stopwatch = Stopwatch()..start();
    try {
      final accountsEither = await accountsRepository.getAccounts(uid: uid);
      return accountsEither.fold(
        (failure) => EitherUtils.left(failure),
        (accounts) async {
          // Choose default or first account if not specified
          AccountEntity? account;
          if (accountId != null) {
            account = accounts.firstWhere(
              (a) => a.accountId == accountId,
              orElse: () => accounts.isNotEmpty ? accounts.first : throw StateError('No accounts available'),
            );
          } else {
            account = accounts.firstWhere(
              (a) => a.isDefault,
              orElse: () => accounts.isNotEmpty ? accounts.first : throw StateError('No accounts available'),
            );
          }

          // Fetch last 4 transactions for the selected account (ignore date range per requirement)
          final selectedAccountId = account.accountId;
          if (selectedAccountId == null) {
            return EitherUtils.left(AccountFailure('Invalid account selected'));
          }

          // last 3 transactions
          final rows = await _db.query(
            'transactions',
            where: 'uid = ? AND account_id = ?',
            whereArgs: [uid, selectedAccountId],
            orderBy: 'occurred_on DESC, transaction_id DESC',
            limit: 3,
          );
          final accountTxns = rows
              .map((r) => _transactionModelToEntity(TransactionModel.fromJson(r)))
              .toList();

          // balance from view v_account_running_balance (last row for account)
          double balance = 0.0;
          final balRows = await _db.query(
            'v_account_running_balance',
            where: 'account_id = ?',
            whereArgs: [selectedAccountId],
            orderBy: 'occurred_on DESC, transaction_id DESC',
            limit: 1,
          );
          if (balRows.isNotEmpty) {
            final rb = balRows.first;
            final value = rb['running_balance'];
            if (value is num) balance = value.toDouble();
            if (value is String) balance = double.tryParse(value) ?? 0.0;
          }

          stopwatch.stop();
          logger.logSuccess('Dashboard account summary', userId: uid, context: {
            'accountId': selectedAccountId,
            'transactionCount': accountTxns.length,
            'durationMs': stopwatch.elapsed.inMilliseconds,
          });
          return EitherUtils.right(
            AccountDetailsSummary(
              account: account,
              transactions: accountTxns,
              balance: balance,
            ),
          );
        },
      );
    } catch (e, st) {
      stopwatch.stop();
      return EitherUtils.left(AccountFailure('Failed to load account details', cause: e, stackTrace: st));
    }
  }

  String _fmt(DateTime dt) {
    // Compare by date (yyyy-MM-dd) to match occurred_on date semantics
    return dt.toIso8601String().split('T').first;
  }
}


