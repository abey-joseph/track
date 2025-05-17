import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class FetchHabitsOnlyUseCase {
  final HabitRepo habitRepo;

  FetchHabitsOnlyUseCase({required this.habitRepo});

  Future<Either<Failure, List<HabitEntity>>> call() async {
    //get habit data
    return habitRepo.fetchAllHabitDataToUpdateMainUI();
  }
}
