import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@injectable
class GetTodayTransactions {
  final ExpenseRepository _repository;

  GetTodayTransactions(this._repository);

  Future<Either<Failure, List<TransactionEntity>>> call({
    required String uid,
    int limit = 10,
  }) async {
    return await _repository.getTodayTransactions(
      uid: uid,
      limit: limit,
    );
  }
}
