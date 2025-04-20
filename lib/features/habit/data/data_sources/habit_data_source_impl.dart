import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/data/data_sources/habit_data_source.dart';
import 'package:track/features/habit/data/models/habit_model.dart';
import 'package:track/features/habit/data/models/habit_status_model.dart';

@LazySingleton(as: HabitDataSource)
class HabitDataSourceImpl implements HabitDataSource {
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
  Future<Either<Failure, DateTime>> getLastEntryDate() {
    // TODO: implement getLastEntryDate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<HabitStatusModel>>> getHabitStatusForListOfDates(
      List<DateTime> dateList) {
    // TODO: implement getHabitStatusForListOfDates
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertHabit(HabitModel habit) {
    // TODO: implement insertHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> insertHabitStatusList(
      List<HabitStatusModel> listOfHabitStatus) {
    // TODO: implement insertHabitStatusList
    throw UnimplementedError();
  }
}
