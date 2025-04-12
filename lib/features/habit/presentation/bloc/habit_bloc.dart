import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/habit/domain/use_cases/database/get_the_last_date.dart';
import 'package:track/features/habit/domain/use_cases/date_head/check_for_date_difference.dart';
import 'package:track/features/habit/domain/use_cases/date_head/get_last_5_days.dart';

part 'habit_event.dart';
part 'habit_state.dart';
part 'habit_bloc.freezed.dart';

@lazySingleton
class HabitBloc extends Bloc<HabitEvent, HabitState> {
  Timer? _timerToCheckDateChange;

  HabitBloc() : super(HabitInitial()) {
    on<updateDateHead>((event, emit) {
      //get the last 5 dates into a list
      //trigger a new [dateListForDateHeadUpdatedState] state with that list
      emit(dateListForDateHeadUpdatedState(dateList: GetLast5Days()()));
      //GetLast5Days()() this format make use of the call function inside the [GetLast5Days] class '()()'
    });

    on<checkDateToFindDifference>((event, emit) {
      //cancel the previous timer if any to jsut to make sure it never called again and opens multiple timer
      try {
        _timerToCheckDateChange?.cancel();
      } catch (e) {
        log("Timer error - issue while canceling timer in [checkDateForDateHead] event to make sure no multimer running - ${e.toString()}");
      }
      //create a timer that check the below things every one minute
      _timerToCheckDateChange =
          Timer.periodic(const Duration(seconds: 15), (timer) {
        //get the last date entered
        DateTime lastEntryDate = getIt<GetTheLastDate>()();

        //get the date differnce
        int dateDifference = getIt<CheckForDateDifference>()(lastEntryDate);

        //check if the date if different
        if (dateDifference > 0) {
          //if yes then trigger [updateDateHead] event
          add(updateDateHead());

          // also make other neccacary changes in UI if the date is different
        }
      });
    });
  }
  @override
  Future<void> close() {
    _timerToCheckDateChange?.cancel(); // clean up the timer
    return super.close(); // call parent class close
  }
}
