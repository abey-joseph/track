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
import 'package:track/features/habit/domain/use_cases/database/delete_status.dart';
import 'package:track/features/habit/domain/use_cases/database/edit_habit.dart';
import 'package:track/features/habit/domain/use_cases/database/fetch_habits_and_status.dart';
import 'package:track/features/habit/domain/use_cases/database/fetch_habits_only.dart';
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
  final FetchHabitsOnlyUseCase fetchHabitsOnlyUseCase;
  final DeleteStatus deleteStatus;

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
    this.fetchHabitsOnlyUseCase,
    this.deleteStatus,
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
      dateDifferenceHabitEvent,
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

    on<DeleteStatusDueToDateDifference>(
      (event, emit) async {
        // trigger the delete statuse process from the dateList from the event
        final result = await deleteStatus.deleteListOfStatusBasedOnDateList(
            dateList: event.extraDays);

        result.fold((ifLeft) {
          log('Found issue to delete the extra status after finding there is extra status data for future dates, to avoid the checking again - event with timer to check it will be keep on stop ');
        }, (ifRight) {
          // trigger main UI update with th updated data
          add(FetchHabitsDataToUpdateMainUI());
          // make the date check class aware that date is updated
          // get the current date by subtracting one day from the extra days list - to avoid if there is any datechange occur in processing time
          getTheLastDate.updateLastEntryDate(
              event.extraDays[0].subtract(Duration(days: 1)));
          // trigger the event with timer to check date difference again
          add(CheckDateToFindDifferenceHabitEvent());
        });
      },
    );
  }

  FutureOr<void> dateDifferenceHabitEvent(
      DateDifferentHabitEvent event, emit) async {
    // cancel the timer first to avoid multiple triggers can trigger the event again after the deletion
    _timerToCheckDateChange!.cancel();
    //check if the date if different
    final currentDate = DateTime.now();
    if (event.dateDifference > 0) {
      //if yes then
      // add empty data for the extra days
      // first of all fetch all the habits to create empty status data for them
      final List<HabitEntity> habits = [];
      final result = await fetchHabitsOnlyUseCase();
      result.fold((ifLeft) {
        log("While trying to get the habits list to create empty data after date difference found ran into an error");
      }, (ifRight) {
        habits.addAll(ifRight);
      });

      // get the empty data to a list
      final List<HabitStatusEntity> habitStatusList =
          addEmptyData.basedOnDateDifference(
              currentDate.subtract(Duration(days: event.dateDifference)),
              currentDate,
              habits);
      // the empty status list then added to database
      final resultForAddStatus = await addStatus.addStatusList(habitStatusList);

      // check for any Failure if Failure then need to drop the add habit process and delete the added Habit Name and then AddHabit Fail state
      await resultForAddStatus.fold((ifLeft) async {
        // do something if fail
        log("Failed to add empty Habit Status data after finding the date difference is more than zero");
        // after this fold the date check event will trigger again and trigger this function again
      }, (ifRight) async {
        // make the date check class aware that status is updated
        getTheLastDate.updateLastEntryDate(currentDate);
      });
      // then trigger [fetchHabitsDataToUpdateMainUI] event
      add(FetchHabitsDataToUpdateMainUI());
      // trigger the date check event again to start the timer and start check for date again
      add(CheckDateToFindDifferenceHabitEvent());
    } else if (event.dateDifference < 0) {
      // in a case were last record date is higher than the current date
      // warn the user with the date difference and take permssion before deleting the extra data
      final List<DateTime> listOfDates = List.generate(
        -event.dateDifference,
        (index) => DateTime(
          currentDate.year,
          currentDate.month,
          currentDate.day,
        ).add(Duration(days: index + 1)),
      );
      emit(NegetiveDateDifferenceHabitState(
          variableToIdentifyNewTrigger: DateTime.now().toString(),
          extraDays: listOfDates));
    }
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

  FutureOr<void> _checkDateToFindDifferenceHabitEvent(event, emit) async {
    //cancel the previous timer if any to jsut to make sure it never called again and opens multiple timer
    try {
      _timerToCheckDateChange?.cancel();
    } catch (e) {
      log("Timer error - issue while canceling timer in [checkDateForDateHead] event to make sure no multiple timer running - ${e.toString()}");
    }

    //create a timer that check the below things every one minute
    _timerToCheckDateChange =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      // implement a immediately invoked async function (IIFE) to get the async features because timer callback doesnt support async
      () async {
        //get the last date entered
        DateTime lastEntryDate = await getTheLastDate();

        //get the date differnce
        int dateDifference = checkForDateDifference(lastEntryDate);

        //log("Date Difference is $dateDifference");

        // check if there is any difference in date means not Zero then trigger event to handle it
        if (dateDifference != 0) {
          add(DateDifferentHabitEvent(dateDifference: dateDifference));
        }
      }();
    });
  }

  @override
  Future<void> close() {
    _timerToCheckDateChange?.cancel(); // clean up the timer
    return super.close(); // call parent class close
  }
}
