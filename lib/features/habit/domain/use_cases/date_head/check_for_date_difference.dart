import 'dart:developer';

import 'package:injectable/injectable.dart';

@lazySingleton
class CheckForDateDifference {
  DateTime currentDate = DateTime.now();

  int call(DateTime lastEntryDate) {
    try {
      return normalize(currentDate).difference(normalize(lastEntryDate)).inDays;
    } catch (e) {
      log('error while check date difference in [lib/features/habit/domain/use_cases/date_head/check_for_date_difference.dart] and returned 0 as the difference  -- ${e.toString()}');
      return 0;
    }
  }

  DateTime normalize(DateTime date) =>
      DateTime(date.year, date.month, date.day);
}
