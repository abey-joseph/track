part of 'track_bloc.dart';

@freezed
class TrackEvent with _$TrackEvent {
  const factory TrackEvent.checkFirstTimeOpenOrNot() = checkFirstTimeOpenOrNot;
  const factory TrackEvent.navBarClicked({required int value}) = navBarClicked;
}
