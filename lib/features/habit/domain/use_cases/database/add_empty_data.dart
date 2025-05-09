import 'package:injectable/injectable.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class AddEmptyData {
  final HabitRepo habitRepo;
  AddEmptyData(this.habitRepo);

  basedOnDateDifference() {}
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
