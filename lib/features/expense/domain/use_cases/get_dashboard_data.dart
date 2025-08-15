import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/dashboard_data.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/use_cases/get_recent_transactions.dart';
import 'package:track/features/expense/domain/use_cases/get_transaction_count_in_period.dart';
import 'package:track/features/expense/domain/use_cases/get_today_transactions.dart';

@injectable
class GetDashboardData {
  final GetRecentTransactions _getRecentTransactions;
  final GetTransactionCountInPeriod _getTransactionCountInPeriod;
  final GetTodayTransactions _getTodayTransactions;

  GetDashboardData(
    this._getRecentTransactions,
    this._getTransactionCountInPeriod,
    this._getTodayTransactions,
  );

  Future<Either<Failure, DashboardData>> call({
    required String uid,
    int limit = 10,
    int dayCount = 30,
  }) async {
    try {
      // Get recent transactions
      final recentTransactionsResult = await _getRecentTransactions.call(
        uid: uid,
        limit: limit,
        dayCount: dayCount,
      );

      if (recentTransactionsResult.isLeft()) {
        return Left(recentTransactionsResult.fold((l) => l, (r) => UnknownFailure('Unknown error')));
      }

      // Get transaction count
      final transactionCountResult = await _getTransactionCountInPeriod.call(
        uid: uid,
        dayCount: dayCount,
      );

      if (transactionCountResult.isLeft()) {
        return Left(transactionCountResult.fold((l) => l, (r) => UnknownFailure('Unknown error')));
      }

      // Get today's transactions
      final todayTransactionsResult = await _getTodayTransactions.call(
        uid: uid,
        limit: limit,
      );

      if (todayTransactionsResult.isLeft()) {
        return Left(todayTransactionsResult.fold((l) => l, (r) => UnknownFailure('Unknown error')));
      }

      final recentTransactions = recentTransactionsResult.fold((l) => <TransactionEntity>[], (r) => r);
      final todayTransactions = todayTransactionsResult.fold((l) => <TransactionEntity>[], (r) => r);
      final transactionCount = transactionCountResult.fold((l) => 0, (r) => r);

      return Right(DashboardData(
        recentTransactions: recentTransactions,
        todayTransactions: todayTransactions,
        transactionCountInPeriod: transactionCount,
        periodDays: dayCount,
      ));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
