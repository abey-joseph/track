import 'package:dartz/dartz.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/features/expense/domain/entities/expense_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repo.dart';

class ExpenseRepoImpl implements ExpenseRepo {
  @override
  Future<Either<DatabaseFailure, void>> addExpenseToDb(
      {required ExpenseEntity expense}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, void>> deleteExpenseInDb(
      {required ExpenseEntity expense}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, void>> editExpenseInDb(
      {required ExpenseEntity expense}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, List<ExpenseEntity>>>
      fetchAllExpenseDataFromDb() {
    throw UnimplementedError();
  }
}
