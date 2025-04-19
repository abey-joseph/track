part of 'habit_bloc.dart';

@freezed
class HabitState with _$HabitState {
  const factory HabitState.habitInitial() = HabitInitial;

  // loading state
  const factory HabitState.loadingHabitState() = LoadingHabitState;

  // main update state
  const factory HabitState.mainUpdateHabitState() = MainUpdateHabitState;

  // just the data update state
  const factory HabitState.statusUpdateHabitState() = StatusUpdateHabitState;

  // error state
  const factory HabitState.errorHabitState() = ErrorHabitState;

  // to be listened only -
  //add state
  const factory HabitState.addDoneHabitState() = AddDoneHabitState;

  //delete state
  const factory HabitState.deleteDoneHabitState() = DeleteDoneHabitState;

  // dateListForDateHeadUpdatedState is to bring the list of last 5 dates to show in [DateHead]
  const factory HabitState.dateListForDateHeadUpdatedState(
          {required List<Map<String, String>> dateList}) =
      dateListForDateHeadUpdatedState;

  //Analyse related states are yet to be added -
}
