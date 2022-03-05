import 'package:firebase_auth/firebase_auth.dart';
import 'package:freshflowtask/src/helpers/event_helper.dart';
import 'package:freshflowtask/src/helpers/locator.dart';

class AuthRepo {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  EventsHelper eventsHelper = locator<EventsHelper>();

  Stream<User?> authChangeStream() {
    return firebaseAuth.authStateChanges();
  }

  bool currentAuthStatus() {
    return firebaseAuth.currentUser != null;
  }

  Future<UserCredential> login({required String email, required String password}) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      eventsHelper.logEvent(name: 'login_success', parameters: {'email': email});
      return user;
    } on FirebaseAuthException catch (error) {
      final String message = error.message ?? 'An error occurred';
      eventsHelper.logEvent(name: 'login_failure', parameters: {'email': email, 'reason': message});
      throw message;
    }
  }

  Future<void> logout() async {
    eventsHelper.logEvent(name: 'logout', parameters: {'email': firebaseAuth.currentUser?.email});
    return await firebaseAuth.signOut();
  }
}
