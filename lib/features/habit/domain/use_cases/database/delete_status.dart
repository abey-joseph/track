import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class DeleteStatus {
  final HabitRepo habitRepo;
  DeleteStatus({required this.habitRepo});

  Future<Either<Failure, void>> deleteListOfStatusBasedOnDateList(
      {required List<DateTime> dateList}) async {
    //log(dateList.toString());
    final List<DateTime> listOfCorrectedDates = dateList
        .map((date) => DateTime(date.year, date.month, date.day))
        .toList();
    final List<String> listOfDatesConvertedToString =
        listOfCorrectedDates.map((date) => date.toIso8601String()).toList();
    return await habitRepo.deleteStatusBasedOnDateList(
        dateList: listOfDatesConvertedToString);
  }
}
