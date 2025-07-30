import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/expense/data/data_sources/expense_data_source.dart';
import 'package:track/features/expense/data/models/expense_model.dart';
import 'package:track/features/expense/domain/entities/expense_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repo.dart';

@LazySingleton(as: ExpenseRepo)
class ExpenseRepoImpl implements ExpenseRepo {
  final ExpenseDataSource dataSource;

  ExpenseRepoImpl(this.dataSource);
  @override
  Future<Either<DatabaseFailure, void>> addExpenseToDb(
      {required ExpenseEntity expense}) async {
    final model = fromExpenseEntity(expense);
    final result = await dataSource.insertExpense(model);
    return result.fold(
      (l) => left(l as DatabaseFailure),
      (_) => right(null),
    );
  }

  @override
  Future<Either<DatabaseFailure, void>> deleteExpenseInDb(
      {required ExpenseEntity expense}) async {
    if (expense.id == null) {
      return left(DatabaseDeleteFailure('Expense id is null'));
    }
    final result = await dataSource.deleteExpense(expense.id!);
    return result.fold(
      (l) => left(l as DatabaseFailure),
      (_) => right(null),
    );
  }

  @override
  Future<Either<DatabaseFailure, void>> editExpenseInDb(
      {required ExpenseEntity expense}) async {
    final model = fromExpenseEntity(expense);
    final result = await dataSource.updateExpense(model);
    return result.fold(
      (l) => left(l as DatabaseFailure),
      (_) => right(null),
    );
  }

  @override
  Future<Either<DatabaseFailure, List<ExpenseEntity>>>
      fetchAllExpenseDataFromDb() async {
    final result = await dataSource.fetchAllExpenses();
    return result.fold(
      (l) => left(l as DatabaseFailure),
      (list) => right(list.map(fromExpenseModel).toList()),
    );
  }
}
