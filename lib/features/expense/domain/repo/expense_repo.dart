import 'package:dartz/dartz.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/features/expense/domain/entities/expense_entity.dart';

abstract class ExpenseRepo {
  Future<Either<DatabaseFailure, List<ExpenseEntity>>>
      fetchAllExpenseDataFromDb();
  Future<Either<DatabaseFailure, void>> addExpenseToDb(
      {required ExpenseEntity expense});
  Future<Either<DatabaseFailure, void>> editExpenseInDb(
      {required ExpenseEntity expense});
  Future<Either<DatabaseFailure, void>> deleteExpenseInDb(
      {required ExpenseEntity expense});
}
