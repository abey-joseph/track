part of 'track_bloc.dart';

@freezed
class TrackEvent with _$TrackEvent {
  const factory TrackEvent.checkFirstTimeOpenOrNot() = checkFirstTimeOpenOrNot;
  const factory TrackEvent.navBarClicked(
      {required int value, bool? isTriggerdByPage}) = navBarClicked;
  const factory TrackEvent.ensureDefaultsForUser({required String uid}) = ensureDefaultsForUser;
  const factory TrackEvent.insertSampleDataForUser({required String uid}) = insertSampleDataForUser;
}
