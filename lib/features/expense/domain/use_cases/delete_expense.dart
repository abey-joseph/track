import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/features/expense/domain/entities/expense_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repo.dart';

@lazySingleton
class DeleteExpenseUseCase {
  final ExpenseRepo repo;
  DeleteExpenseUseCase(this.repo);

  Future<Either<DatabaseFailure, void>> call(ExpenseEntity expense) {
    return repo.deleteExpenseInDb(expense: expense);
  }
}
