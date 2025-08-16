import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/failures/failure.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/expense/domain/entities/transaction_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repository.dart';

@lazySingleton
class GetTransactions {
  final ExpenseRepository _repo = getIt<ExpenseRepository>();
  
  Future<Either<Failure, List<TransactionEntity>>> call({required String uid, DateTime? from, DateTime? to}) =>
      _repo.getTransactions(uid: uid, from: from, to: to);
}


