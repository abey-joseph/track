import 'package:dartz/dartz.dart';
import 'package:track/core/errors/expense_errors.dart';
import 'package:track/features/expense/domain/entities/expense_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repo.dart';

class ExpenseRepoImpl implements ExpenseRepo {
  @override
  Future<Either<ExpenseFailure, void>> addExpenseToDb(
      {required ExpenseEntity expense}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ExpenseFailure, void>> deleteExpenseInDb(
      {required ExpenseEntity expense}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ExpenseFailure, void>> editExpenseInDb(
      {required ExpenseEntity expense}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<ExpenseFailure, List<ExpenseEntity>>>
      fetchAllExpenseDataFromDb() {
    throw UnimplementedError();
  }
}
