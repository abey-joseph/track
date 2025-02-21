import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/common/domain/use_cases/check_first_time.dart';

part 'track_event.dart';
part 'track_state.dart';
part 'track_bloc.freezed.dart';

@lazySingleton
class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackBloc() : super(initial()) {
    on<checkFirstTimeOpenOrNot>(checkFirstTimeOpenOrNotEvent);
  }

  FutureOr<void> checkFirstTimeOpenOrNotEvent(event, emit) async {
    emit(firstTimeOpen(
        isFirstTime: await getIt<CheckFirstTime>().isFirstTimeLauch()));
  }
}
