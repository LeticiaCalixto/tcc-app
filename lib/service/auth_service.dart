import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc_app/view/pages/home/login_page.dart';

Future<UserCredential?> authService({
  required String email,
  required String password,
  final VoidCallback? onSuccess,
  final VoidCallback? onUserNotFound,
  final VoidCallback? onWrongPassword,
}) async {
  final _firebaseAuth = FirebaseAuth.instance;
  UserCredential? userCredential;
  try {
    userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (userCredential.user != null) {
      onSuccess?.call();
      return userCredential;
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      onUserNotFound?.call();
    } else if (e.code == 'wrong-password') {
      onWrongPassword?.call();
    } else {
      onUserNotFound?.call();
    }
  }
  return userCredential;
}

Future<void> signOut({
  required BuildContext context,
}) async {
  await FirebaseAuth.instance.signOut().then(
        (user) => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage())),
      );
}