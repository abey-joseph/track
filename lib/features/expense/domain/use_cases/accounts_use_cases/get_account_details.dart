import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';
import 'package:track/features/expense/domain/entities/helper_classes/account_details_helpers.dart';
import 'package:track/features/expense/domain/entities/view_entities/account/account_details.dart';
import 'package:track/features/expense/domain/use_cases/helper_methods/filter/filter_helpers.dart';
import 'package:track/features/expense/domain/entities/view_entities/misc/expense_filter.dart';

@lazySingleton
class GetAccountDetailsSummary {
  final AccountsRepository _repo = getIt<AccountsRepository>();

  Future<Either<Failure, AccountDetailsSummary>> call({
    required String uid,
    required int accountId,
  }) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetAccountDetailsSummary use case', tag: 'UseCases');

    final filter = getIt<AccountFilter>();

    // get account from repo
    final accountResult = await _repo.getAccount(
      uid: uid,
      accountId: accountId,
    );

    // get transactions from repo bases on filter
    DateTime? fromDate = getFromDate(filter);
    DateTime? toDate = getToDate(filter);
    TransactionType? transactionType = getTransactionType(filter);

    final transactionsResult = await _repo.getAccountTransactions(
      uid: uid,
      accountId: accountId,
      fromDate: fromDate,
      toDate: toDate,
      transactionType: transactionType,
    );

    // get balance info from transactions
    final balanceInfoResult = await _repo.getAccountBalanceInfo(
      uid: uid,
      accountId: accountId,
    );

    // fetch true current balance regardless of filter
    final currentBalanceResult = await _repo.getAccountBalance(
      uid: uid,
      accountId: accountId,
    );
    final currentBalance = currentBalanceResult.fold((_) => 0.0, (b) => b);

    // return summary
    return accountResult.fold(
      (failure) {
        stopwatch.stop();
        logger.logFailure(failure,
            operation: 'GetAccountDetailsSummaryUseCase',
            userId: uid,
            context: {'durationMs': stopwatch.elapsed.inMilliseconds});
        return left(failure);
      },
      (account) {
        return transactionsResult.fold(
          (failure) {
            stopwatch.stop();
            logger.logFailure(failure,
                operation: 'GetAccountDetailsSummaryUseCase',
                userId: uid,
                context: {'durationMs': stopwatch.elapsed.inMilliseconds});
            return left(failure);
          },
          (transactions) {
            return balanceInfoResult.fold(
              (failure) {
                stopwatch.stop();
                logger.logFailure(failure,
                    operation: 'GetAccountDetailsSummaryUseCase',
                    userId: uid,
                    context: {'durationMs': stopwatch.elapsed.inMilliseconds});
                return left(failure);
              },
              (balanceInfo) {
                stopwatch.stop();
                logger.logSuccess('GetAccountDetailsSummaryUseCase',
                    userId: uid,
                    context: {
                      'accountId': accountId,
                      'durationMs': stopwatch.elapsed.inMilliseconds
                    });

                final totals = AccountTotals(
                  incoming: balanceInfo.totalIncoming,
                  outgoing: balanceInfo.totalOutgoing,
                  net: balanceInfo.netAmount,
                  balance: currentBalance,
                );
                final counts = AccountCounts(
                  incoming: balanceInfo.incomingCount,
                  outgoing: balanceInfo.outgoingCount,
                  total: balanceInfo.totalTransactions,
                );
                final donutData = generateDonutData(totals);
                final groupedTransactions =
                    groupTransactionsByDay(transactions);

                final summary = AccountDetailsSummary(
                  account: account,
                  balanceInfo: balanceInfo,
                  totals: totals,
                  counts: counts,
                  donutData: donutData,
                  groupedTransactions: groupedTransactions,
                );

                return right(summary);
              },
            );
          },
        );
      },
    );
  }
}

@lazySingleton
class GetAccountTransactions {
  final AccountsRepository _repo = getIt<AccountsRepository>();

  Future<Either<Failure, List<TransactionEntity>>> call({
    required String uid,
    required int accountId,
    DateTime? fromDate,
    DateTime? toDate,
    TransactionType? transactionType,
  }) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetAccountTransactions use case', tag: 'UseCases');

    final result = await _repo.getAccountTransactions(
      uid: uid,
      accountId: accountId,
      fromDate: fromDate,
      toDate: toDate,
      transactionType: transactionType,
    );

    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure,
            operation: 'GetAccountTransactionsUseCase',
            userId: uid,
            context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (transactions) {
        logger
            .logSuccess('GetAccountTransactionsUseCase', userId: uid, context: {
          'accountId': accountId,
          'transactionCount': transactions.length,
          'durationMs': stopwatch.elapsed.inMilliseconds
        });
      },
    );

    return result;
  }
}

@lazySingleton
class GetAccountBalanceInfo {
  final AccountsRepository _repo = getIt<AccountsRepository>();

  Future<Either<Failure, AccountBalanceInfo>> call({
    required String uid,
    required int accountId,
  }) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetAccountBalanceInfo use case', tag: 'UseCases');

    final result = await _repo.getAccountBalanceInfo(
      uid: uid,
      accountId: accountId,
    );

    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure,
            operation: 'GetAccountBalanceInfoUseCase',
            userId: uid,
            context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (balanceInfo) {
        logger.logSuccess('GetAccountBalanceInfoUseCase',
            userId: uid,
            context: {
              'accountId': accountId,
              'durationMs': stopwatch.elapsed.inMilliseconds
            });
      },
    );

    return result;
  }
}

@lazySingleton
class GetCurrentAccountBalance {
  final AccountsRepository _repo = getIt<AccountsRepository>();

  Future<Either<Failure, double>> call({
    required String uid,
    required int accountId,
  }) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetCurrentAccountBalance use case', tag: 'UseCases');

    final result = await _repo.getAccountBalance(
      uid: uid,
      accountId: accountId,
    );

    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure,
            operation: 'GetCurrentAccountBalanceUseCase',
            userId: uid,
            context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (balance) {
        logger.logSuccess('GetCurrentAccountBalanceUseCase',
            userId: uid,
            context: {
              'accountId': accountId,
              'durationMs': stopwatch.elapsed.inMilliseconds
            });
      },
    );

    return result;
  }
}
