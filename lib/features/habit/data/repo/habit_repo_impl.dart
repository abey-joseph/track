import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/database_errors.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/data/data_sources/habit_data_source.dart';
import 'package:track/features/habit/data/models/habit_model.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@LazySingleton(as: HabitRepo)
class HabitRepoImpl extends HabitRepo {
  final HabitDataSource habitDataSource;

  HabitRepoImpl(this.habitDataSource);

  @override
  Future<Either<Failure, void>> addHabit(HabitEntity habitEntity) async {
    // convert the HabitEntity to HabitModel
    final habitModel = fromEntityToModel(habitEntity);
    // add to database and record the output whether its a failure or void
    final dataInsertionOutput = await habitDataSource.insertHabit(habitModel);
    // return based on the result of database operation
    return dataInsertionOutput;
  }

  @override
  Future<Either<Failure, void>> deleteHabit(int id) {
    // TODO: implement deleteHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> editHabit(HabitEntity editedHabit) {
    // TODO: implement editHabit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<HabitEntity>>> fetchDataToUpdateMainUI(
      List<DateTime> datesToBeFetched) {
    // TODO: implement fetchDataToUpdateMainUI
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, DateTime>> fetchLastUpdatedDate() async {
    final result = await habitDataSource.getLastEntryDate();
    return result.fold((failure) {
      return left(failure);
    }, (dateString) {
      return right(stringToDate(dateString));
    });
  }

  @override
  Future<Either<DatabaseFailure, void>> addEmptyDataBasedOnDateDifference(
      HabitStatusEntity habitStatusEntity) {
    // TODO: implement addEmptyDataBasedOnDateDifference
    throw UnimplementedError();
  }
}

DateTime stringToDate(dynamic date) => DateTime.parse(date as String);
