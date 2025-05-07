import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/data/data_sources/habit_data_source.dart';
import 'package:track/features/habit/data/models/habit_model.dart';
import 'package:track/features/habit/data/models/habit_status_model.dart';
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
    final habitModel = fromHabitEntityToModel(habitEntity);
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
  Future<Either<Failure, List<HabitEntity>>>
      fetchAllHabitDataToUpdateMainUI() async {
    // get the data from the database in the form of [HabitModel]
    final fetchResult = await habitDataSource.getAllHabits();

    // return if failure , if not then convert to [HabitEntity] and return it
    return fetchResult.fold((ifLeft) => left(ifLeft), (listOfHabitModel) {
      List<HabitEntity> listAfterConvertedToEntity = [];
      for (var habitModelItem in listOfHabitModel) {
        listAfterConvertedToEntity.add(fromHabitModelToEntity(habitModelItem));
      }
      return right(listAfterConvertedToEntity);
    });
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
  Future<Either<Failure, void>> addEmptyDataBasedOnDateDifference(
      HabitStatusEntity habitStatusEntity) async {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<HabitStatusEntity>>>
      fetchLast20StatusDataToUpdateMainUI() async {
    // get the data from the database in the form of [HabitStatusModel]
    final fetchResult =
        await habitDataSource.getLast20EntryOfHabitStatusForEachHabit();

    // return if failure , if not then convert to [HabitStatusEntity] and return it
    return fetchResult.fold((ifLeft) => left(ifLeft), (listOfStatusModel) {
      List<HabitStatusEntity> listAfterConvertedToEntity = [];
      for (var statusModelItem in listOfStatusModel) {
        listAfterConvertedToEntity
            .add(fromStatusModelToEntity(statusModelItem));
      }
      return right(listAfterConvertedToEntity);
    });
  }
}

DateTime stringToDate(dynamic date) => DateTime.parse(date as String);
