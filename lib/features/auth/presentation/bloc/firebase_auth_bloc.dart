import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
import 'package:track/core/auth/firebase_services.dart';
import 'package:track/core/database/database/app_database.dart';

part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';
part 'firebase_auth_bloc.freezed.dart';

@injectable
class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final FirebaseAuthService auth;
  final AppDatabase db;
  FirebaseAuthBloc(this.auth, this.db)
      : super(const FirebaseAuthState.initial()) {
    on<_CheckRequested>(_onCheckRequested);
    on<_SignInRequested>(_onSignInRequested);
    on<_SignUpRequested>(_onSignUpRequested);
    on<_SignOutRequested>(_onSignOutRequested);
    on<_SaveDisplayName>(_onSaveDisplayName);
  }

  Future<void> _onCheckRequested(
    _CheckRequested event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    emit(const FirebaseAuthState.loading());
    try {
      // If your service doesn't have isSignedIn(), implement it there.
      final isLoggedIn = await auth.isSignedIn();
      if (isLoggedIn) {
        emit(const FirebaseAuthState.authenticated());
      } else {
        emit(const FirebaseAuthState.unauthenticated());
      }
    } catch (e) {
      emit(FirebaseAuthState.failure(e.toString()));
      emit(const FirebaseAuthState.unauthenticated());
    }
  }

  Future<void> _onSignInRequested(
    _SignInRequested event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    emit(const FirebaseAuthState.loading());
    try {
      await auth.signIn(event.email, event.password);

      try {
        final uid = auth.currentUser?.uid;
        if (uid != null) {
          await db.instance.insert(
            'users',
            {'uid': uid},
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        }
        log("user added in database");
      } catch (e) {
        log("user cannot be added to database - ${e.toString()}");
      }

      emit(const FirebaseAuthState.authenticated());
    } on FirebaseAuthException catch (e) {
      final code = e.code.toLowerCase();
      String msg;
      //log("failed $code");
      switch (code) {
        case 'user-not-found':
          msg = 'User not found';
          break;
        case 'invalid-credential':
          msg = 'Incorrect password';
          break;
        case 'wrong-password':
          msg = 'Incorrect password';
          break;
        case 'invalid-email':
          msg = 'Enter a valid email address';
          break;
        default:
          msg = e.message ?? 'Sign in failed';
      }
      emit(FirebaseAuthState.failure(msg.toString()));
      emit(const FirebaseAuthState.unauthenticated());
    } catch (e) {
      emit(FirebaseAuthState.failure(e.toString()));
      emit(const FirebaseAuthState.unauthenticated());
    }
  }

  Future<void> _onSignUpRequested(
    _SignUpRequested event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    emit(const FirebaseAuthState.loading());
    try {
      await auth.signUp(event.email, event.password);

      try {
        final uid = auth.currentUser?.uid;
        if (uid != null) {
          await db.instance.insert(
            'users',
            {'uid': uid},
            conflictAlgorithm: ConflictAlgorithm.ignore,
          );
        }
        log("user added in database");
      } catch (e) {
        log("user cannot be added to database - ${e.toString()}");
      }

      emit(const FirebaseAuthState.authenticated());
    } on FirebaseAuthException catch (e) {
      final code = e.code.toLowerCase();
      String msg;
      switch (code) {
        case 'email-already-in-use':
          msg = 'Email already registered';
          break;
        case 'invalid-email':
          msg = 'Enter a valid email address';
          break;
        case 'weak-password':
          msg = 'Choose a stronger password';
          break;
        default:
          msg = e.message ?? 'Sign up failed';
      }
      emit(FirebaseAuthState.failure(msg));
      emit(const FirebaseAuthState.unauthenticated());
    } catch (e) {
      emit(FirebaseAuthState.failure(e.toString()));
      emit(const FirebaseAuthState.unauthenticated());
    }
  }

  Future<void> _onSignOutRequested(
    _SignOutRequested event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    emit(const FirebaseAuthState.loading());
    try {
      await auth.signOut();
      emit(const FirebaseAuthState.unauthenticated());
    } catch (e) {
      emit(FirebaseAuthState.failure(e.toString()));
      emit(const FirebaseAuthState.unauthenticated());
    }
  }

  Future<void> _onSaveDisplayName(
    _SaveDisplayName event,
    Emitter<FirebaseAuthState> emit,
  ) async {
    emit(const FirebaseAuthState.loading());
    try {
      final uid = auth.currentUser?.uid;
      if (uid == null) {
        emit(const FirebaseAuthState.unauthenticated());
        return;
      }

      // Try update first; if no row, insert with uid + name
      final updated = await db.instance.update(
        'users',
        {
          'name': event.name,
        },
        where: 'uid = ?',
        whereArgs: [uid],
      );

      if (updated == 0) {
        await db.instance.insert(
          'users',
          {
            'uid': uid,
            'name': event.name,
          },
          conflictAlgorithm: ConflictAlgorithm.ignore,
        );
      }

      emit(const FirebaseAuthState.authenticated());
    } catch (e) {
      emit(FirebaseAuthState.failure(e.toString()));
      // Keep the user on the previous auth state; but for safety:
      emit(const FirebaseAuthState.unauthenticated());
    }
  }
}
