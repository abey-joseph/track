import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@injectable
class GetTransactionCountInPeriod {
  final ExpenseRepository _repository;

  GetTransactionCountInPeriod(this._repository);

  Future<Either<Failure, int>> call({
    required String uid,
    required int dayCount,
  }) async {
    return await _repository.getTransactionCountInPeriod(
      uid: uid,
      dayCount: dayCount,
    );
  }
}
