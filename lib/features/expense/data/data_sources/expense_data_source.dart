import 'package:dartz/dartz.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/expense/data/models/expense_model.dart';

abstract class ExpenseDataSource {
  Future<Either<Failure, List<ExpenseModel>>> fetchAllExpenses();
  Future<Either<Failure, int>> insertExpense(ExpenseModel expense);
  Future<Either<Failure, void>> deleteExpense(int id);
  Future<Either<Failure, void>> updateExpense(ExpenseModel expense);
}
