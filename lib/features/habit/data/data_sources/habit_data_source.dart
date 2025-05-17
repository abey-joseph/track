import 'package:dartz/dartz.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/data/models/habit_model.dart';
import 'package:track/features/habit/data/models/habit_status_model.dart';

abstract class HabitDataSource {
  //read
  Future<Either<Failure, List<HabitModel>>> getAllHabits();
  Future<Either<Failure, List<HabitStatusModel>>> getAllHabitStatus();
  Future<Either<Failure, List<HabitStatusModel>>>
      getLast20EntryOfHabitStatusForEachHabit();
  Future<Either<DatabaseFailure, String>> getLastEntryDate();

  //write
  Future<Either<Failure, void>> insertHabitStatusList(
      List<HabitStatusModel>
          listOfHabitStatus); //making it possible to insert multiple rows of data at a time
  Future<Either<Failure, int>> insertHabit(HabitModel habit);
  Future<Either<Failure, int>> insertHabitStatus(HabitStatusModel status);
  Future<Either<Failure, void>> deleteHabit(int id);
  Future<Either<Failure, void>> deleteStatusListBasedOnDateList(
      List<String> dateList);
}
