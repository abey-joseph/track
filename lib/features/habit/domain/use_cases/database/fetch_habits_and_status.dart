import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/failure.dart';
import 'package:track/features/habit/domain/entities/habit_display_entity.dart';
import 'package:track/features/habit/domain/repo/habit_repo.dart';

@lazySingleton
class FetchHabitsDataToUpdateMainUIUseCase {
  final HabitRepo habitRepo;

  FetchHabitsDataToUpdateMainUIUseCase({required this.habitRepo});

  Future<Either<Failure, List<HabitDisplayEntity>>> call() async {
    // list of HabitDisplayEntity to return
    List<HabitDisplayEntity> habitDisplayEntityList = [];

    //get habit data
    final habitFetchResult = await habitRepo.fetchAllHabitDataToUpdateMainUI();
    //get habit status data
    final statusFetchResult =
        await habitRepo.fetchLast20StatusDataToUpdateMainUI();

    //check the return is a failure or data
    return habitFetchResult.fold((habitleft) => left(habitleft), (habitright) {
      return statusFetchResult.fold((statusLeft) => left(statusLeft),
          (statusRight) {
        // convert to habitDisplayEntity class and return
        // we will go through each item in [habitRight] (which is the list returned)
        // and then add it to the [habitDisplayEntityList]
        //while adding we filter out [statusRight] based on the habitID and then add it also
        // finally we return the new list

        for (var habit in habitright) {
          habitDisplayEntityList.add(HabitDisplayEntity(
              habit: habit,
              statusList: statusRight
                  .where((item) => item.habitId == habit.habitId)
                  .toList()));
        }
        return right(habitDisplayEntityList);
      });
    });
  }
}
