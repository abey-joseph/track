part of 'firebase_auth_bloc.dart';

@freezed
class FirebaseAuthEvent with _$FirebaseAuthEvent {
  const factory FirebaseAuthEvent.checkRequested() = _CheckRequested;
  const factory FirebaseAuthEvent.signInRequested({
    required String email,
    required String password,
  }) = _SignInRequested;
  const factory FirebaseAuthEvent.signUpRequested({
    required String email,
    required String password,
  }) = _SignUpRequested;
  const factory FirebaseAuthEvent.signOutRequested() = _SignOutRequested;
  const factory FirebaseAuthEvent.saveDisplayName({
    required String name,
  }) = _SaveDisplayName;
}
