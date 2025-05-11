import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class DeleteHabitUseCase {
  final HabitRepo habitRepo;
  DeleteHabitUseCase({required this.habitRepo});

  Future<Either<Failure, void>> call(int habitId) async {
    return await habitRepo.deleteHabit(habitId);
  }
}
