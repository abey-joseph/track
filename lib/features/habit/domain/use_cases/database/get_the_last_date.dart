import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class GetTheLastDate {
  final HabitRepo habitRepo;
  GetTheLastDate(this.habitRepo);

  bool _isFirstTime = true;
  DateTime? _lastDate;

  Future<DateTime> call() async {
    if (_isFirstTime) {
      final result = await habitRepo.fetchLastUpdatedDate();
      return result.fold((failure) {
        log('Error while getting last entry date from database - instead passed date for today - thus make the date difference always be no difference - reason - ${failure.message}');
        return DateTime.now();
      }, (date) {
        log("message");
        _lastDate = date;
        _isFirstTime = false;
        return date;
      });
    } else {
      return _lastDate!;
    }
  }

  updateLastEntryDate(DateTime date) {
    _lastDate = date;
    _isFirstTime = false;
  }
}
