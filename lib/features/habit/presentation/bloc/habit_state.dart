part of 'habit_bloc.dart';

@freezed
class HabitState with _$HabitState {
  const factory HabitState.habitInitial() = HabitInitial;

  // dateListForDateHeadUpdatedState is to bring the list of last 5 dates to show in [DateHead]
  const factory HabitState.dateListForDateHeadUpdatedState(
          {required List<Map<String, String>> dateList}) =
      dateListForDateHeadUpdatedState;
}
