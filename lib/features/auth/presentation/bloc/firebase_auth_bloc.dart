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

  /// Creates default categories and accounts for a new user
  Future<void> _createDefaultDataForUser(String uid) async {
    try {
      // First, get the user_id for this uid
      final userResult = await db.instance.query(
        'users',
        where: 'uid = ?',
        whereArgs: [uid],
        columns: ['user_id'],
      );
      
      if (userResult.isEmpty) {
        log("User not found with uid: $uid");
        return;
      }
      
      final userId = userResult.first['user_id'] as int;
      log("Found user_id: $userId for uid: $uid");

      // Insert default categories
              await db.instance.insert(
          'categories',
          {
            'user_id': userId,
            'uid': uid,
            'name': 'Food & Dining',
            'type': 'expense',
            'icon': 'restaurant',
            'sort_order': 1,
          },
        );
        
        await db.instance.insert(
          'categories',
          {
            'user_id': userId,
            'uid': uid,
            'name': 'Transportation',
            'type': 'expense',
            'icon': 'directions_car',
            'sort_order': 2,
          },
        );
        
        await db.instance.insert(
          'categories',
          {
            'user_id': userId,
            'uid': uid,
            'name': 'Shopping',
            'type': 'expense',
            'icon': 'shopping_bag',
            'sort_order': 3,
          },
        );
        
        await db.instance.insert(
          'categories',
          {
            'user_id': userId,
            'uid': uid,
            'name': 'Entertainment',
            'type': 'expense',
            'icon': 'movie',
            'sort_order': 4,
          },
        );
        
        await db.instance.insert(
          'categories',
          {
            'user_id': userId,
            'uid': uid,
            'name': 'Salary',
            'type': 'income',
            'icon': 'work',
            'sort_order': 1,
          },
        );
        
        await db.instance.insert(
          'categories',
          {
            'user_id': userId,
            'uid': uid,
            'name': 'Freelance',
            'type': 'income',
            'icon': 'laptop',
            'sort_order': 2,
          },
        );

      // Insert default accounts
      await db.instance.insert(
        'accounts',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Cash Wallet',
          'type': 'CASH',
          'currency': 'USD',
          'is_archived': 0,
        },
      );
      
      await db.instance.insert(
        'accounts',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Bank Account',
          'type': 'BANK',
          'currency': 'USD',
          'is_archived': 0,
        },
      );
      
      await db.instance.insert(
        'accounts',
        {
          'user_id': userId,
          'uid': uid,
          'name': 'Credit Card',
          'type': 'CARD',
          'currency': 'USD',
          'is_archived': 0,
        },
      );

      log("Default categories and accounts created for user: $uid (user_id: $userId)");
    } catch (e) {
      log("Failed to create default data for user: ${e.toString()}");
    }
  }

  /// Checks if a user needs default data and creates it if necessary
  Future<void> _ensureUserHasDefaultData(String uid) async {
    try {
      // Check if user already has categories
      final userResult = await db.instance.query(
        'users',
        where: 'uid = ?',
        whereArgs: [uid],
        columns: ['user_id'],
      );
      
      if (userResult.isEmpty) {
        log("User not found with uid: $uid");
        return;
      }
      
      final userId = userResult.first['user_id'] as int;
      
      final categories = await db.instance.query(
        'categories',
        where: 'user_id = ?',
        whereArgs: [userId],
        limit: 1,
      );
      
      // If no categories exist, create default data
      if (categories.isEmpty) {
        await _createDefaultDataForUser(uid);
      }
    } catch (e) {
      log("Failed to check/create default data for user: ${e.toString()}");
    }
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
        final user = auth.currentUser;
        if (user != null) {
          await _ensureUserHasDefaultData(user.uid);
          emit(FirebaseAuthState.authenticated(
            uid: user.uid,
            email: user.email ?? '',
            displayName: user.displayName,
          ));
        } else {
          emit(const FirebaseAuthState.unauthenticated());
        }
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
          // Create default data for the user
          await _createDefaultDataForUser(uid);
        }
        log("user added in database");
      } catch (e) {
        log("user cannot be added to database - ${e.toString()}");
      }

      final user = auth.currentUser;
      if (user != null) {
        emit(FirebaseAuthState.authenticated(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName,
        ));
      } else {
        emit(const FirebaseAuthState.unauthenticated());
      }
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
          // Create default data for the user
          await _createDefaultDataForUser(uid);
        }
        log("user added in database");
      } catch (e) {
        log("user cannot be added to database - ${e.toString()}");
      }

      final user = auth.currentUser;
      if (user != null) {
        emit(FirebaseAuthState.authenticated(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName,
        ));
      } else {
        emit(const FirebaseAuthState.unauthenticated());
      }
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

      final user = auth.currentUser;
      if (user != null) {
        emit(FirebaseAuthState.authenticated(
          uid: user.uid,
          email: user.email ?? '',
          displayName: user.displayName,
        ));
      } else {
        emit(const FirebaseAuthState.unauthenticated());
      }
    } catch (e) {
      emit(FirebaseAuthState.failure(e.toString()));
      // Keep the user on the previous auth state; but for safety:
      emit(const FirebaseAuthState.unauthenticated());
    }
  }
}
