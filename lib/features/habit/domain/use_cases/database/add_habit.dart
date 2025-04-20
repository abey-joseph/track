import 'package:injectable/injectable.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class AddHabitUseCase {
  final HabitRepo habitRepo;
  AddHabitUseCase(this.habitRepo);
}
