import 'package:dartz/dartz.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';

abstract class HabitRepo {
  Future<Either<DatabaseFailure, void>> addHabit(HabitEntity habit);
  Future<Either<DatabaseFailure, void>> editHabit(HabitEntity editedHabit);
  Future<Either<DatabaseFailure, void>> deleteHabit(int id);
  Future<Either<DatabaseFailure, DateTime>> fetchLastUpdatedDate();
  Future<Either<DatabaseFailure, List<HabitEntity>>> fetchDataToUpdateMainUI(
      List<DateTime> datesToBeFetched);
  Future<Either<DatabaseFailure, void>> addEmptyDataBasedOnDateDifference(
      HabitStatusEntity habitStatusEntity);
}
