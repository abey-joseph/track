part of 'habit_bloc.dart';

@freezed
class HabitEvent with _$HabitEvent {
  // these event will check if the page opens for first time or not then trigger updating UI based on that
  const factory HabitEvent.startHabitEvent() = StartHabitEvent;

  // event to fetch and emit main update state
  const factory HabitEvent.fetchHabitsDataToUpdateMainUI() =
      FetchHabitsDataToUpdateMainUI;

  // event to check date difference in every few seconds
  const factory HabitEvent.checkDateToFindDifferenceHabitEvent() =
      CheckDateToFindDifferenceHabitEvent;

  // event to handle if date is different
  const factory HabitEvent.dateDifferentHabitEvent() = DateDifferentHabitEvent;

  // event to handle add habit event
  const factory HabitEvent.addHabitEvent() = AddHabitEvent;

  // event to handle edit habit event
  const factory HabitEvent.editHabitEvent() = EditHabitEvent;

  // event to handle delete habit event
  const factory HabitEvent.deleteHabitEvent() = DeleteHabitEvent;

  // event to handle habit status change event
  const factory HabitEvent.changeStatusHabitEvent() = ChangeStatusHabitEvent;

  //Analyse related event are yet to be added -
}
