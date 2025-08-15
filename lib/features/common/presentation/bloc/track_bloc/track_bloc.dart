import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/common/domain/use_cases/check_first_time.dart';
import 'package:track/features/common/domain/use_cases/ensure_defaults_if_empty.dart';
import 'package:track/features/common/domain/use_cases/insert_sample_data.dart';

part 'track_event.dart';
part 'track_state.dart';
part 'track_bloc.freezed.dart';

@lazySingleton
class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super(initial()) {
    on<checkFirstTimeOpenOrNot>(checkFirstTimeOpenOrNotEvent);
    on<navBarClicked>(navBarClickedEvent);
    on<ensureDefaultsForUser>(ensureDefaultsForUserEvent);
    on<insertSampleDataForUser>(insertSampleDataForUserEvent);
  }

  FutureOr<void> navBarClickedEvent<navBarClicked>(event, emit) {
    if (event.isTriggerdByPage == null || event.isTriggerdByPage == false) {
      emit(navBarItemChanged(value: event.value, isTriggerdByPage: false));
    } else {
      emit(navBarItemChanged(value: event.value, isTriggerdByPage: true));
    }
    //log('emitted the new value ${event.value}');
  }

  FutureOr<void> checkFirstTimeOpenOrNotEvent(event, emit) async {
    // log not imported here by design to keep bloc lean; rely on snackbars/UI
    emit(firstTimeOpen(
        isFirstTime: await getIt<CheckFirstTime>().isFirstTimeLauch()));
  }

  FutureOr<void> ensureDefaultsForUserEvent(ensureDefaultsForUser event, Emitter<TrackState> emit) async {
    emit(const dataSeedingInProgress());
    try {
      // Seed defaults if empty (accounts, categories)
      await getIt<EnsureDefaultsIfEmpty>().call(uid: event.uid);
      emit(const dataSeedingSuccess());
    } catch (e) {
      emit(dataSeedingFailure(message: e.toString()));
    }
  }

  FutureOr<void> insertSampleDataForUserEvent(insertSampleDataForUser event, Emitter<TrackState> emit) async {
    emit(const dataSeedingInProgress());
    try {
      // Insert sample transactions and any required supporting data
      await getIt<InsertSampleData>().call(uid: event.uid);
      emit(const dataSeedingSuccess());
    } catch (e) {
      emit(dataSeedingFailure(message: e.toString()));
    }
  }
}
