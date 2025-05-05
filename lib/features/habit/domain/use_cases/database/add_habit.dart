import 'package:injectable/injectable.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class AddHabitUseCase {
  final HabitRepo habitRepo;
  AddHabitUseCase(this.habitRepo);

  Future<void> call(HabitEntity habit) {
    return habitRepo.addHabit(habit);
  }
}
