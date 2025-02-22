part of 'track_bloc.dart';

@freezed
class TrackState with _$TrackState {
  const factory TrackState.initial() = initial;
  const factory TrackState.firstTimeOpen({required bool isFirstTime}) =
      firstTimeOpen;
  const factory TrackState.navBarItemChanged(
      {required int value, required bool isTriggerdByPage}) = navBarItemChanged;
}
