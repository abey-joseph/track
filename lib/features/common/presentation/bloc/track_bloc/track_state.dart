part of 'track_bloc.dart';

@freezed
class TrackState with _$TrackState {
  const factory TrackState.initial() = initial;
  const factory TrackState.firstTimeOpen({required bool isFirstTime}) =
      firstTimeOpen;
}
