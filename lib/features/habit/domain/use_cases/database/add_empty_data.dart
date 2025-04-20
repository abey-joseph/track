import 'package:injectable/injectable.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class AddEmptyDataBasedOnDateDifference {
  final HabitRepo habitRepo;
  AddEmptyDataBasedOnDateDifference(this.habitRepo);
}
