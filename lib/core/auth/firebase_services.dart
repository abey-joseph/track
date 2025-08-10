import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseAuthService {
  final FirebaseAuth _auth;
  FirebaseAuthService(this._auth);

  // Stream for auth changes (null when signed out)
  Stream<User?> get authState => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<bool> isSignedIn() async {
    final user = _auth.currentUser ?? await _auth.authStateChanges().first;
    return user != null;
  }

  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() => _auth.signOut();

  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) await user.sendEmailVerification();
  }

  Future<void> sendPasswordReset(String email) =>
      _auth.sendPasswordResetEmail(email: email);
}
