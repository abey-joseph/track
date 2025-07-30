import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/data_sources/sq_lite.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/expense/data/data_sources/expense_data_source.dart';
import 'package:track/features/expense/data/models/expense_model.dart';

@LazySingleton(as: ExpenseDataSource)
class ExpenseDataSourceImpl implements ExpenseDataSource {
  final Db database;
  ExpenseDataSourceImpl(this.database);

  @override
  Future<Either<Failure, int>> insertExpense(ExpenseModel expense) async {
    try {
      final db = database.db;
      final id = await db.insert(
        'expenses',
        expense.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return right(id);
    } catch (e) {
      return left(DatabaseAddFailure('Failed to insert expense: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<ExpenseModel>>> fetchAllExpenses() async {
    try {
      final db = database.db;
      final result = await db.query('expenses', orderBy: 'date DESC');
      final list = result.map((e) => ExpenseModel.fromJson(e)).toList();
      return right(list);
    } catch (e) {
      return left(DatabaseFetchFailure('Failed to fetch expenses: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteExpense(int id) async {
    try {
      final db = database.db;
      final deleted = await db.delete('expenses', where: 'id = ?', whereArgs: [id]);
      if (deleted == 0) {
        return left(DatabaseDeleteFailure('No expense found with ID $id'));
      }
      return right(null);
    } catch (e) {
      return left(DatabaseDeleteFailure('Failed to delete expense: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> updateExpense(ExpenseModel expense) async {
    try {
      final db = database.db;
      final count = await db.update(
        'expenses',
        expense.toJson(),
        where: 'id = ?',
        whereArgs: [expense.id],
      );
      if (count == 0) {
        return left(DatabaseEditFailure('No expense found with ID ${expense.id}'));
      }
      return right(null);
    } catch (e) {
      return left(DatabaseEditFailure('Failed to update expense: ${e.toString()}'));
    }
  }
}
