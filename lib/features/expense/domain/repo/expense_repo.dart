import 'package:dartz/dartz.dart';
import 'package:track/core/errors/expense_errors.dart';
import 'package:track/features/expense/domain/entities/expense_entity.dart';

abstract class ExpenseRepo {
  Future<Either<ExpenseFailure, List<ExpenseEntity>>>
      fetchAllExpenseDataFromDb();
  Future<Either<ExpenseFailure, void>> addExpenseToDb(
      {required ExpenseEntity expense});
  Future<Either<ExpenseFailure, void>> editExpenseInDb(
      {required ExpenseEntity expense});
  Future<Either<ExpenseFailure, void>> deleteExpenseInDb(
      {required ExpenseEntity expense});
}
