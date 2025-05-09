import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/core/errors/input_errors.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';
import 'package:track/features/habit/domain/use_cases/misc/input_validation.dart';

@lazySingleton
class AddHabitUseCase {
  final HabitRepo habitRepo;
  AddHabitUseCase(this.habitRepo);

  Future<Either<Failure, int>> call(HabitEntity habitEntity) async {
    final validation = HabitInputValidator(
        habitName: habitEntity.habitName,
        isBinary: habitEntity.isBinary,
        countType: habitEntity.countType,
        target: habitEntity.target,
        targetType: habitEntity.targetType,
        frquencyType: habitEntity.frequencyType,
        weekDays: habitEntity.selectedDays,
        inEveryXDays: habitEntity.inEveryXDays)();
    if (validation.isValid == false) {
      return left(
          InputErrors(validation.errorMessage ?? 'Please check your input'));
    } else {
      return await habitRepo.addHabit(habitEntity);
    }
  }
}
