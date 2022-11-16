import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_project_with_firebase/src/Utils/util.dart';
import 'package:first_project_with_firebase/src/constants/route_names.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? get currentUser => auth.currentUser;

  Stream<User?> get authStateChanges => auth.authStateChanges();

  Future sendPasswordResetEmail({required String email}) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  Future ceateUserWithEmailAndPassword({required String email, required String password}) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future signInWithEmailAndPassword(
      {required String email, required String password, required BuildContext context}) async {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Navigator.of(context).pushNamed(RouteNames.chatScreen))
        .onError((error, stackTrace) => Util().showSnackBar(content: 'User does  not exist', context: context));
  }

  Future<void> saveUserInFireStore(String email, String password) async {
    await FirebaseFirestore.instance.collection('users').add({'email': email, 'password': password});
  }

  Future signOut() async {
    await auth.signOut();
  }
}
