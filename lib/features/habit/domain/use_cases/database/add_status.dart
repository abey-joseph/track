import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class AddStatus {
  final HabitRepo habitRepo;
  AddStatus({required this.habitRepo});

  Future<Either<Failure, void>> addStatusList(
      List<HabitStatusEntity> habitStatusEntityList) async {
    return await habitRepo.addBatchStatusData(habitStatusEntityList);
  }

  Future<Either<Failure, void>> addSingleStatus(
      HabitStatusEntity habitStatusEntity) async {
    return await habitRepo.addStatus(habitStatusEntity);
  }
}
