part of 'habit_bloc.dart';

@freezed
class HabitEvent with _$HabitEvent {
  const factory HabitEvent.started() = _Started;
}