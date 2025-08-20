import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/accounts_repository.dart';

@lazySingleton
class GetAccountDetailsSummary {
  final AccountsRepository _repo = getIt<AccountsRepository>();
  
  Future<Either<Failure, AccountDetailsSummary>> call({
    required String uid,
    required int accountId,
  }) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetAccountDetailsSummary use case', tag: 'UseCases');
    
    final result = await _repo.getAccountDetailsSummary(
      uid: uid,
      accountId: accountId,
    );
    
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'GetAccountDetailsSummaryUseCase', userId: uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (summary) {
        logger.logSuccess('GetAccountDetailsSummaryUseCase', userId: uid, context: {'accountId': accountId, 'transactionCount': summary.transactions.length, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    
    return result;
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
        logger.logFailure(failure, operation: 'GetAccountTransactionsUseCase', userId: uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (transactions) {
        logger.logSuccess('GetAccountTransactionsUseCase', userId: uid, context: {'accountId': accountId, 'transactionCount': transactions.length, 'durationMs': stopwatch.elapsed.inMilliseconds});
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
        logger.logFailure(failure, operation: 'GetAccountBalanceInfoUseCase', userId: uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (balanceInfo) {
        logger.logSuccess('GetAccountBalanceInfoUseCase', userId: uid, context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds});
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
        logger.logFailure(failure, operation: 'GetCurrentAccountBalanceUseCase', userId: uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (balance) {
        logger.logSuccess('GetCurrentAccountBalanceUseCase', userId: uid, context: {'accountId': accountId, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    
    return result;
  }
}
