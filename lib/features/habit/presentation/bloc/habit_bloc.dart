import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';

import 'package:track/features/habit/domain/use_cases/database/add_habit.dart';
import 'package:track/features/habit/domain/use_cases/database/delete_habit.dart';
import 'package:track/features/habit/domain/use_cases/database/edit_habit.dart';
import 'package:track/features/habit/domain/use_cases/database/fetch_habits.dart';
import 'package:track/features/habit/domain/use_cases/database/get_the_last_date.dart';
import 'package:track/features/habit/domain/use_cases/date_head/check_for_date_difference.dart';
import 'package:track/features/habit/domain/use_cases/date_head/get_last_5_days.dart';

part 'habit_event.dart';
part 'habit_state.dart';
part 'habit_bloc.freezed.dart';

@injectable
class HabitBloc extends Bloc<HabitEvent, HabitState> {
  Timer? _timerToCheckDateChange;
  final GetLast5Days getLast5Days;
  final GetTheLastDate getTheLastDate;
  final CheckForDateDifference checkForDateDifference;
  final AddHabitUseCase addHabitUseCase;
  final EditHabitUseCase editHabitUseCase;
  final DeleteHabitUseCase deleteHabitUseCase;
  final FetchHabitsDataToUpdateMainUIUseCase
      fetchHabitsDataToUpdateMainUIuseCase;

  HabitBloc(
    this.getLast5Days,
    this.getTheLastDate,
    this.checkForDateDifference,
    this.addHabitUseCase,
    this.editHabitUseCase,
    this.deleteHabitUseCase,
    this.fetchHabitsDataToUpdateMainUIuseCase,
  ) : super(HabitInitial()) {
    //starting event
    on<StartHabitEvent>(
      (event, emit) {
        // trigger the loading state
        emit(LoadingHabitState());

        // trigger event to fetch data and emit main update state
        add(FetchHabitsDataToUpdateMainUI());

        // trigger event to check the date change frequently
        add(CheckDateToFindDifferenceHabitEvent());
      },
    );

    // event to fetch and emit main update state
    on<FetchHabitsDataToUpdateMainUI>(
      (event, emit) {
        //fetch data
        //then trigger [MainUpdateHabitState]

        //below is for datehead only
        emit(dateListForDateHeadUpdatedState(dateList: getLast5Days()));
      },
    );

    // event to check date difference in every few seconds
    on<CheckDateToFindDifferenceHabitEvent>(
      _checkDateToFindDifferenceHabitEvent,
    );

    // event to habdle if date is different
    on<DateDifferentHabitEvent>(
      (event, emit) {
        //add extra data
        //trigger [FetchHabitsDataToUpdateMainUI]
      },
    );

    // event to handle add habit event
    on<AddHabitEvent>(
      (event, emit) async {
        //add the new date to database
        final addHabitOutput = await addHabitUseCase(event.habitEntity);
        //trigger [FetchHabitsDataToUpdateMainUI] base on the output
        addHabitOutput.fold((left) {
          log(left.message);
        }, (right) {
          emit(AddDoneHabitState());
          add(FetchHabitsDataToUpdateMainUI());
        });
      },
    );

    // event to handle edit habit event
    on<EditHabitEvent>(
      (event, emit) {
        //update the database with the new data
        //check if the name, frequency changed
        //if yes then only trigger [FetchHabitsDataToUpdateMainUI]
      },
    );

    // event to handle delete habit event
    on<DeleteHabitEvent>(
      (event, emit) {
        //delete the dat from database
        //trigger [FetchHabitsDataToUpdateMainUI]
      },
    );

    // event to handle habit status change event
    on<ChangeStatusHabitEvent>(
      (event, emit) {
        //update the database
        //trigger [StatusUpdateHabitState] to update the status widget
      },
    );
  }

  FutureOr<void> _checkDateToFindDifferenceHabitEvent(event, emit) {
    //cancel the previous timer if any to jsut to make sure it never called again and opens multiple timer
    try {
      _timerToCheckDateChange?.cancel();
    } catch (e) {
      log("Timer error - issue while canceling timer in [checkDateForDateHead] event to make sure no multiple timer running - ${e.toString()}");
    }

    //create a timer that check the below things every one minute
    _timerToCheckDateChange =
        Timer.periodic(const Duration(seconds: 15), (timer) async {
      //get the last date entered
      DateTime lastEntryDate = await getTheLastDate();

      //get the date differnce
      int dateDifference = checkForDateDifference(lastEntryDate);

      //check if the date if different
      if (dateDifference > 0) {
        //if yes then
        //add empty data for the extra days
        // then trigger [fetchHabitsDataToUpdateMainUI] event
        add(FetchHabitsDataToUpdateMainUI());
      }
    });
  }

  @override
  Future<void> close() {
    _timerToCheckDateChange?.cancel(); // clean up the timer
    return super.close(); // call parent class close
  }
}
