import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/auth/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  @lazySingleton
  Future<FirebaseApp> get firebaseApp async {
    try {
      log("Firebase init done ");
      return await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
    } catch (e, st) {
      log('Firebase initialization failed: $e', stackTrace: st);
      rethrow;
    }
  }

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
