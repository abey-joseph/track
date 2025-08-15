import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@injectable
class GetRecentTransactions {
  final ExpenseRepository _repository;

  GetRecentTransactions(this._repository);

  Future<Either<Failure, List<TransactionEntity>>> call({
    required String uid,
    int limit = 10,
    int dayCount = 30,
  }) async {
    return await _repository.getRecentTransactions(
      uid: uid,
      limit: limit,
      dayCount: dayCount,
    );
  }
}
