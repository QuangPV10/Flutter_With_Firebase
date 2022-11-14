import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future sendPasswordResetEmail({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future ceateUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signOut() async {
    await auth.signOut();
  }
}
