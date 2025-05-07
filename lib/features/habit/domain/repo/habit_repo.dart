import 'package:dartz/dartz.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';

abstract class HabitRepo {
  Future<Either<Failure, void>> addHabit(HabitEntity habitEntity);
  Future<Either<Failure, void>> editHabit(HabitEntity editedHabit);
  Future<Either<Failure, void>> deleteHabit(int id);
  Future<Either<Failure, DateTime>> fetchLastUpdatedDate();
  Future<Either<Failure, List<HabitEntity>>> fetchAllHabitDataToUpdateMainUI();
  Future<Either<Failure, List<HabitStatusEntity>>>
      fetchLast20StatusDataToUpdateMainUI();
  Future<Either<Failure, void>> addEmptyDataBasedOnDateDifference(
      HabitStatusEntity habitStatusEntity);
}
