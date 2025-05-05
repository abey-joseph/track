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
  Future<Either<Failure, List<HabitStatusModel>>> getAllHabitStatus() {
    // TODO: implement getAllHabitStatus
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<HabitModel>>> getAllHabits() {
    // TODO: implement getAllHabits
    throw UnimplementedError();
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
  Future<Either<Failure, List<HabitStatusModel>>> getHabitStatusForListOfDates(
      List<DateTime> dateList) {
    // TODO: implement getHabitStatusForListOfDates
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertHabit(HabitModel habit) async {
    try {
      final db = database.db;

      await db.insert(
        'habits',
        habit.toJson(), // directly uses the Freezed-generated map
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return right(null);
    } catch (e) {
      return left(
          DatabaseAddFailure('Failed to insert habit: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> insertHabitStatusList(
      List<HabitStatusModel> listOfHabitStatus) {
    // TODO: implement insertHabitStatusList
    throw UnimplementedError();
  }
}
