import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:track/core/auth/firebase_options.dart';

@module
abstract class FirebaseModule {
  @preResolve
  @lazySingleton
  Future<FirebaseApp> get firebaseApp async =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
