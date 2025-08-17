import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
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
  final DashboardRepository _repo = getIt<DashboardRepository>();

  Future<Either<Failure, AccountDetailsSummary>> call({
    required String uid,
    int? accountId,
  }) async {
    logger.info('Executing GetAccountDetailsSummary', tag: 'UseCases');
    // No date range for account summary; repo fetches last 3 and balance
    final now = DateTime.now();
    return _repo.getAccountDetailsSummary(
        uid: uid, accountId: accountId);
  }
}


