import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/raw_entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@lazySingleton
class GetTransactions {
  final ExpenseRepository _repo = getIt<ExpenseRepository>();
  
  Future<Either<Failure, List<TransactionEntity>>> call({required String uid, DateTime? from, DateTime? to}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing GetTransactions use case', tag: 'UseCases');
    final result = await _repo.getTransactions(uid: uid, from: from, to: to);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'GetTransactionsUseCase', userId: uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (transactions) {
        logger.logSuccess('GetTransactionsUseCase', userId: uid, context: {'transactionCount': transactions.length, 'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}


