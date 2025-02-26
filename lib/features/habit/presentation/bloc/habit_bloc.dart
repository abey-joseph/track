import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_event.dart';
part 'habit_state.dart';
part 'habit_bloc.freezed.dart';

class HabitBloc extends Bloc<HabitEvent, HabitState> {
  HabitBloc() : super(_Initial()) {
    on<HabitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
