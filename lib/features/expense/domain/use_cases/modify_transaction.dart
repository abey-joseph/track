import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/services/logging_service.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@lazySingleton
class AddTransaction {
  final ExpenseRepository _repo = getIt<ExpenseRepository>();
  Future<Either<Failure, void>> call({required TransactionEntity transaction}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing AddTransaction use case', tag: 'UseCases');
    final result = await _repo.addTransaction(transaction: transaction);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'AddTransactionUseCase', userId: transaction.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('AddTransactionUseCase', userId: transaction.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}

@lazySingleton
class UpdateTransaction {
  final ExpenseRepository _repo = getIt<ExpenseRepository>();
  Future<Either<Failure, void>> call({required TransactionEntity transaction}) async {
    final stopwatch = Stopwatch()..start();
    logger.info('Executing UpdateTransaction use case', tag: 'UseCases');
    final result = await _repo.updateTransaction(transaction: transaction);
    stopwatch.stop();
    result.fold(
      (failure) {
        logger.logFailure(failure, operation: 'UpdateTransactionUseCase', userId: transaction.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
      (_) {
        logger.logSuccess('UpdateTransactionUseCase', userId: transaction.uid, context: {'durationMs': stopwatch.elapsed.inMilliseconds});
      },
    );
    return result;
  }
}


