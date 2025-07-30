import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/features/expense/domain/entities/expense_entity.dart';
import 'package:track/features/expense/domain/repo/expense_repo.dart';

@lazySingleton
class FetchExpenseUseCase {
  final ExpenseRepo repo;
  FetchExpenseUseCase(this.repo);

  Future<Either<DatabaseFailure, List<ExpenseEntity>>> call() {
    return repo.fetchAllExpenseDataFromDb();
  }
}
