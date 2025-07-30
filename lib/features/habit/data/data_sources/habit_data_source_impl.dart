import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/data_sources/sq_lite.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/data/data_sources/habit_data_source.dart';
import 'package:track/features/habit/data/models/habit_model.dart';
import 'package:track/features/habit/data/models/habit_status_model.dart';

@LazySingleton(as: HabitDataSource)
class HabitDataSourceImpl implements HabitDataSource {
  final Db database;

  HabitDataSourceImpl(this.database);

  @override
  Future<Either<Failure, List<HabitStatusModel>>> getAllHabitStatus() async {
    try {
      final dbInstance = database.db;
      final result = await dbInstance.query('habit_status');

      final statusList =
          result.map((row) => HabitStatusModel.fromJson(row)).toList();

      return right(statusList);
    } catch (e) {
      return left(
          DatabaseFetchFailure('Failed to fetch habit status: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<HabitModel>>> getAllHabits() async {
    try {
      final dbInstance = database.db;

      final result = await dbInstance.query('habits');

      final habits = result.map((row) => HabitModel.fromJson(row)).toList();

      return right(habits);
    } catch (e) {
      return left(
          DatabaseFetchFailure('Failed to fetch habits: ${e.toString()}'));
    }
  }

  @override
  Future<Either<DatabaseFailure, String>> getLastEntryDate() async {
    try {
      final db = database.db;
      final result = await db.query(
        'habit_status',
        orderBy: 'date DESC',
        limit: 1,
      );

      if (result.isEmpty) {
        return left(DatabaseFetchFailure(
            'Empty data returned while fetching the last entry date'));
      } else {
        return right(result.first['date'] as String);
      }
    } catch (e) {
      return left(DatabaseFetchFailure(
          'unknown error occured while fetching last entry date - reason ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<HabitStatusModel>>>
      getLast20EntryOfHabitStatusForEachHabit() async {
    try {
      final dbInstance = database.db;

      final result = await dbInstance.rawQuery('''
      SELECT * FROM (
        SELECT *, ROW_NUMBER() OVER (PARTITION BY habitId ORDER BY date DESC) AS row_num
        FROM habit_status
      )
      WHERE row_num <= 20
    ''');

      final statusList =
          result.map((row) => HabitStatusModel.fromJson(row)).toList();

      return right(statusList);
    } catch (e) {
      return left(DatabaseFetchFailure(
          'Failed to fetch habit status: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> insertHabit(HabitModel habit) async {
    try {
      final db = database.db;

      // the insert query returns the row ID which is same as habit ID
      final int habitId = await db.insert(
        'habits',
        habit.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // returns the habit ID to do further actions in the bloc
      return right(habitId);
    } catch (e) {
      return left(
          DatabaseAddFailure('Failed to insert habit: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> insertHabitStatusList(
      List<HabitStatusModel> listOfHabitStatus) async {
    try {
      final db = database.db;
      final batch = db.batch();

      for (final status in listOfHabitStatus) {
        batch.insert('habit_status', status.toJson(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }

      await batch.commit(noResult: true);
      return right(null);
    } catch (e) {
      return left(DatabaseAddFailure(
          'Failed to insert habit status list: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, int>> insertHabitStatus(
      HabitStatusModel status) async {
    try {
      final db = database.db;
      final int id = await db.insert(
        'habit_status',
        status.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return right(id);
    } catch (e) {
      return left(
          DatabaseAddFailure('Failed to insert habit status: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteHabit(int id) async {
    try {
      final db = database.db;

      // Only delete from the habits table
      final deleted = await db.delete(
        'habits',
        where: 'habitId = ?',
        whereArgs: [id],
      );

      if (deleted == 0) {
        return left(DatabaseDeleteFailure('No habit found with ID $id'));
      }

      return right(null);
    } catch (e) {
      return left(
          DatabaseDeleteFailure('Failed to delete habit: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteStatusListBasedOnDateList(
      List<String> dateList) async {
    try {
      final db = database.db;

      // final result = await db.query('habit_status');

      // for (final row in result) {
      //   log('Habit Status Row: $row');
      // }

      final batch = db.batch();

      for (final date in dateList) {
        batch.delete(
          'habit_status',
          where: 'date = ?',
          whereArgs: [date],
        );
      }

      final results = await batch.commit(); // noResult: false by default
      int totalDeleted = 0;

      for (final result in results) {
        if (result is int) totalDeleted += result;
      }
      log("total deleted $totalDeleted rows");
      return right(null);
    } catch (e) {
      return left(DatabaseDeleteFailure(
          'Failed to delete habit status for dates: ${e.toString()}'));
    }
  }
}
