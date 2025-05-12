import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/errors/input_errors.dart';
import 'package:track/features/habit/domain/entities/habit_display_entity.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/domain/entities/habit_status_entity.dart';
import 'package:track/features/habit/domain/use_cases/database/add_empty_data.dart';

import 'package:track/features/habit/domain/use_cases/database/add_habit.dart';
import 'package:track/features/habit/domain/use_cases/database/add_status.dart';
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
  final AddEmptyData addEmptyData;
  final AddStatus addStatus;

  HabitBloc(
    this.getLast5Days,
    this.getTheLastDate,
    this.checkForDateDifference,
    this.addHabitUseCase,
    this.editHabitUseCase,
    this.deleteHabitUseCase,
    this.fetchHabitsDataToUpdateMainUIuseCase,
    this.addEmptyData,
    this.addStatus,
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
      (event, emit) async {
        //fetch data
        final fetchResult = await fetchHabitsDataToUpdateMainUIuseCase();

        //check the result
        fetchResult.fold((left) {
          // emit error state
        }, (right) {
          //then trigger [MainUpdateHabitState]
          emit(MainUpdateHabitState(
              habitDiplayList: right, dateList: getLast5Days()));
        });
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
      addHabitEvent,
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
      deleteHabitEvent,
    );

    // event to handle habit status change event
    on<ChangeStatusHabitEvent>(
      (event, emit) {
        //update the database
        //trigger [StatusUpdateHabitState] to update the status widget
      },
    );
  }

  FutureOr<void> deleteHabitEvent(DeleteHabitEvent event, emit) async {
    // check if the habit ID is null or not
    if (event.habitId == null) {
      log("The habit ID to delete is null - triggering DeleteHabitFailed state");
      emit(DeleteFailedhabitState());
    } else {
      //delete the data from database
      final output = await deleteHabitUseCase(event.habitId!);

      //trigger [FetchHabitsDataToUpdateMainUI]
      output.fold((ifLeft) {
        log(ifLeft.message);
        emit(DeleteFailedhabitState());
      }, ((ifRight) {
        emit(DeleteDoneHabitState());
        add(FetchHabitsDataToUpdateMainUI());
      }));
    }
  }

  FutureOr<void> addHabitEvent(AddHabitEvent event, emit) async {
    //add the new date to database

    final addHabitOutput = await addHabitUseCase(event.habitEntity);
    //trigger [FetchHabitsDataToUpdateMainUI] base on the output
    await addHabitOutput.fold((left) async {
      if (left is InputErrors) {
        emit(AddFailedHabitState(
            error: left.message, timestamb: DateTime.now()));
      }
    }, (right) async {
      // right hold the habitId of the new habit
      //add empty status data for the particular habit
      //right side returns the habit ID of the newly inserted habit
      final List<HabitStatusEntity> emptyStatusList =
          addEmptyData.forNewHabit(right);

      // the empty status list then added to database
      final result = await addStatus.addStatusList(emptyStatusList);

      // check for any Failure if Failure then need to drop the add habit process and delete the added Habit Name and then AddHabit Fail state
      await result.fold((ifLeft) async {
        // delete the habit that added in database just now
        await deleteHabitUseCase(right);
        // and trigger the Fail state to update the user
        emit(AddFailedHabitState(error: ifLeft.message));
      }, (ifRight) async {
        // make the date check class aware that new habit is added
        getTheLastDate.updateLastEntryDate(event.habitEntity.createdAt);

        // then initiate the update
        emit(AddDoneHabitState());
        add(FetchHabitsDataToUpdateMainUI());
      });
    });
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
        log("pending to add extra data for status due to date difference ");
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
