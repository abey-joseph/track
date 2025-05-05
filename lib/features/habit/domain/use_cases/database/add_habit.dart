import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class AddHabitUseCase {
  final HabitRepo habitRepo;
  AddHabitUseCase(this.habitRepo);

  Future<Either<Failure, void>> call(HabitEntity habitEntity) async {
    return await habitRepo.addHabit(habitEntity);
  }
}
