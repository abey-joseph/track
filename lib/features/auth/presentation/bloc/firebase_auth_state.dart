part of 'firebase_auth_bloc.dart';

@freezed
class FirebaseAuthState with _$FirebaseAuthState {
  const factory FirebaseAuthState.initial() = authInitial;
  const factory FirebaseAuthState.loading() = authLoading;
  const factory FirebaseAuthState.authenticated({
    required String uid,
    required String email,
    String? displayName,
  }) = authAuthenticated;
  const factory FirebaseAuthState.unauthenticated() = authUnauthenticated;
  const factory FirebaseAuthState.failure(String message) = authFailure;
}
