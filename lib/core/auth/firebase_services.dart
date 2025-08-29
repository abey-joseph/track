import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirebaseAuthService {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthService(this._auth) : _googleSignIn = GoogleSignIn.instance;

  // Stream for auth changes (null when signed out)
  Stream<User?> get authState => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  bool get hasDisplayName =>
      (_auth.currentUser?.displayName?.trim().isNotEmpty ?? false);

  Future<void> updateDisplayName(String name) async {
    final u = _auth.currentUser;
    if (u != null) {
      await u.updateDisplayName(name);
      await u.reload();
    }
  }

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

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Initialize Google Sign In
      await _googleSignIn.initialize();

      // Trigger the authentication flow
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      // Get the authentication tokens
      final authTokens = googleUser.authentication;

      // Get access token using authorization client
      final authClient = googleUser.authorizationClient;
      final scopes = ['openid', 'email', 'profile'];
      final clientAuth = await authClient.authorizeScopes(scopes);

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
          accessToken: clientAuth.accessToken, idToken: authTokens.idToken);

      // Sign in to Firebase with the Google credential
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      log('Google sign in failed: ${e.toString()}');
      if (e is FirebaseAuthException) {
        rethrow;
      }
      throw FirebaseAuthException(
        code: 'google_sign_in_failed',
        message: 'Google sign in failed: ${e.toString()}',
      );
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) await user.sendEmailVerification();
  }

  Future<void> sendPasswordReset(String email) =>
      _auth.sendPasswordResetEmail(email: email);
}
