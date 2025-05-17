import 'package:injectable/injectable.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class AddEmptyData {
  final HabitRepo habitRepo;
  AddEmptyData(this.habitRepo);

  List<HabitStatusEntity> basedOnDateDifference(
      DateTime from, DateTime to, List<HabitEntity> habits) {
    final DateTime fromDate = DateTime(from.year, from.month, from.day);
    final DateTime toDate = DateTime(to.year, to.month, to.day);
    final List<HabitStatusEntity> statusList = [];
    final int dayCount = toDate.difference(fromDate).inDays;
    for (var i = 0; i < habits.length; i++) {
      for (var j = 1; j <= dayCount; j++) {
        //log(fromDate.add(Duration(days: j)).toIso8601String());

        statusList.add(HabitStatusEntity(
            habitId: habits[i].habitId!,
            date: fromDate.add(Duration(days: j)),
            value: null));
      }
    }
    return statusList;
  }

  List<HabitStatusEntity> forNewHabit(int habitId) {
    final now = DateTime.now();
    return List.generate(20, (index) {
      final date = now.subtract(Duration(days: index));
      return HabitStatusEntity(
        habitId: habitId,
        date:
            DateTime(date.year, date.month, date.day), // normalize to date only
        value: null,
        note: null,
        updatedAt: null,
      );
    });
  }
}
