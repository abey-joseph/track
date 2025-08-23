import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/view_entities/account/account_details.dart';
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
    return _repo.getAccountDetailsSummary(uid: uid, accountId: accountId);
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
