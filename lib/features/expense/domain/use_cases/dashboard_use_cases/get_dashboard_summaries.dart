import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/view_entities/account/account_details.dart';
import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';
import 'package:track/features/expense/domain/entities/view_entities/misc/expense_filter.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';
import 'package:track/features/expense/domain/repo/dashboard_repository.dart';

@lazySingleton
class GetRecentTransactionsSummary {
  final DashboardRepository _repo = getIt<DashboardRepository>();

  Future<Either<Failure, RecentTransactionsSummary>> call({
    required String uid,
    required int dayCount,
  }) async {
    final to = DateTime.now();
    final from = to.subtract(Duration(days: dayCount));
    logger.info('Executing GetRecentTransactionsSummary', tag: 'UseCases');
    return _repo.getRecentTransactionsSummary(uid: uid, from: from, to: to);
  }
}

@lazySingleton
class GetAccountDetailsSummary {
  // Compose summary in the domain layer using raw data from repos.
  final AccountsRepository _accountsRepo = getIt<AccountsRepository>();
  final ExpenseRepository _expenseRepo = getIt<ExpenseRepository>();

  Future<Either<Failure, AccountDetailsSummary>> call({
    required String uid,
    int? accountId,
  }) async {
    logger.info('Executing GetAccountDetailsSummary (domain-composed)', tag: 'UseCases');

    // 1) Pick the account: specific -> default -> first
    final accountsEither = await _accountsRepo.getAccounts(uid: uid);
    return await accountsEither.fold(
      (failure) async => Left(failure),
      (accounts) async {
        if (accounts.isEmpty) {
          return Left(UnknownFailure('No accounts available'));
        }

        final account = accountId != null
            ? (accounts.firstWhere(
                (a) => a.accountId == accountId,
                orElse: () => accounts.first,
              ))
            : (accounts.firstWhere(
                (a) => a.isDefault,
                orElse: () => accounts.first,
              ));

        // 2) Read filter and translate to repo params
        final filter = getIt<AccountFilter>();
        DateTime? from;
        DateTime? to;
        TransactionType? txType;

        switch (filter.dateRange) {
          case DateRange.all:
            from = null;
            to = null;
            break;
          case DateRange.today:
            final now = DateTime.now();
            from = DateTime(now.year, now.month, now.day);
            to = DateTime(now.year, now.month, now.day, 23, 59, 59);
            break;
          case DateRange.thisWeek:
            final now = DateTime.now();
            final start = now.subtract(Duration(days: now.weekday - 1));
            from = DateTime(start.year, start.month, start.day);
            to = DateTime(now.year, now.month, now.day, 23, 59, 59);
            break;
          case DateRange.thisMonth:
            final now = DateTime.now();
            from = DateTime(now.year, now.month, 1);
            final nextMonth = DateTime(now.year, now.month + 1, 1).subtract(const Duration(seconds: 1));
            to = nextMonth;
            break;
          case DateRange.custom:
            from = filter.customStartDate;
            to = filter.customEndDate;
            break;
        }

        switch (filter.flow) {
          case TransactionFlow.all:
            txType = null;
            break;
          case TransactionFlow.incoming:
            txType = TransactionType.income;
            break;
          case TransactionFlow.outgoing:
            txType = TransactionType.expense;
            break;
        }

        // 3) Fetch raw data
        final txEither = await _accountsRepo.getAccountTransactions(
          uid: uid,
          accountId: account.accountId!,
          fromDate: from,
          toDate: to,
          transactionType: txType,
        );
        final balEither = await _accountsRepo.getAccountBalance(
          uid: uid,
          accountId: account.accountId!,
        );

        return await txEither.fold(
          (f) async => Left(f),
          (transactions) async => await balEither.fold(
            (f) async => Left(f),
            (balance) async {
              final summary = _buildSummary(
                account: account,
                transactions: transactions,
                balance: balance,
              );
              return Right(summary);
            },
          ),
        );
      },
    );
  }

  AccountDetailsSummary _buildSummary({
    required account,
    required List<TransactionEntity> transactions,
    required double balance,
  }) {
    double incoming = 0.0;
    double outgoing = 0.0; // store as positive magnitude
    int incomingCount = 0;
    int outgoingCount = 0;

    for (final t in transactions) {
      switch (t.type) {
        case TransactionType.income:
          incoming += t.amount.abs();
          incomingCount++;
          break;
        case TransactionType.expense:
          outgoing += t.amount.abs();
          outgoingCount++;
          break;
        case TransactionType.transfer:
          break;
      }
    }

    final net = incoming - outgoing;
    final totals = AccountTotals(
      incoming: incoming,
      outgoing: outgoing,
      net: net,
      balance: balance,
    );
    final counts = AccountCounts(
      total: transactions.length,
      incoming: incomingCount,
      outgoing: outgoingCount,
    );

    final totalFlow = incoming + outgoing;
    final donut = DonutChartData(
      incomingPercentage: totalFlow == 0 ? 0.0 : incoming / totalFlow,
      outgoingPercentage: totalFlow == 0 ? 0.0 : outgoing / totalFlow,
      incomingAmount: incoming,
      outgoingAmount: outgoing,
    );

    final Map<DateTime, List<TransactionEntity>> grouped = {};
    for (final t in transactions) {
      final d = DateTime(t.occurredOn.year, t.occurredOn.month, t.occurredOn.day);
      grouped.putIfAbsent(d, () => []).add(t);
    }

    return AccountDetailsSummary(
      account: account,
      accountActivityInfoBasedOnFilter: AccountActivityInfoBasedOnFilter(
        currentBalance: balance,
        totalIncoming: incoming,
        totalOutgoing: outgoing,
        netAmount: net,
        totalTransactions: transactions.length,
        incomingCount: incomingCount,
        outgoingCount: outgoingCount,
      ),
      totals: totals,
      counts: counts,
      donutData: donut,
      groupedTransactions: grouped,
    );
  }
}

@lazySingleton
class GetAllAccountBalances {
  final DashboardRepository _repo = getIt<DashboardRepository>();

  Future<Either<Failure, List<AccountBalanceItem>>> call({
    required String uid,
  }) async {
    logger.info('Executing GetAllAccountBalances', tag: 'UseCases');
    return _repo.getAllAccountBalances(uid: uid);
  }
}

@lazySingleton
class GetTodayTransactionsSummaryUC {
  final DashboardRepository _repo = getIt<DashboardRepository>();

  Future<Either<Failure, TodayTransactionsSummary>> call({
    required String uid,
  }) async {
    logger.info('Executing GetTodayTransactionsSummary', tag: 'UseCases');
    return _repo.getTodayTransactionsSummary(uid: uid);
  }
}
