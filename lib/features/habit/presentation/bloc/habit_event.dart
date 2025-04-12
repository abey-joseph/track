part of 'habit_bloc.dart';

@freezed
class HabitEvent with _$HabitEvent {
  // to check date and make it to a list and trigger a state to update DateHead
  const factory HabitEvent.updateDateHead() = updateDateHead;

  //to check date and trigger updateDateHead event if there is a new date
  const factory HabitEvent.checkDateToFindDifference() =
      checkDateToFindDifference;
}
