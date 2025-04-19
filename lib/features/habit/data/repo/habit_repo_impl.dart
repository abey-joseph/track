import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/features/habit/data/data_sources/habit_data_source.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@LazySingleton(as: HabitRepo)
class HabitRepoImpl extends HabitRepo {
  final HabitDataSource habitDataSource;

  HabitRepoImpl(this.habitDataSource);

  @override
  Future<Either<DatabaseFailure, void>> addHabit(HabitEntity habit) {
    // TODO: implement addHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, void>> deleteHabit(int id) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, void>> editHabit(HabitEntity editedHabit) {
    // TODO: implement editHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, List<HabitEntity>>> fetchDataToUpdateMainUI(
      List<DateTime> datesToBeFetched) {
    // TODO: implement fetchDataToUpdateMainUI
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, DateTime>> fetchLastUpdatedDate() {
    // TODO: implement fetchLastUpdatedDate
    throw UnimplementedError();
  }

  @override
  Future<Either<DatabaseFailure, void>> addEmptyDataBasedOnDateDifference(
      HabitStatusEntity habitStatusEntity) {
    // TODO: implement addEmptyDataBasedOnDateDifference
    throw UnimplementedError();
  }
}
