
import 'package:dartz/dartz.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';

abstract class ExpenseRepository {
  // Transactions
  Future<Either<Failure, List<TransactionEntity>>> getTransactions({
    required String uid,
    DateTime? from,
    DateTime? to,
  });
  Future<Either<Failure, void>> addTransaction({required TransactionEntity transaction});
  Future<Either<Failure, void>> updateTransaction({required TransactionEntity transaction});
}


