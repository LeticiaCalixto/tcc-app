import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<UserCredential> authService({
  required String email,
  required String password,
  final VoidCallback? onSuccess,
  final VoidCallback? onUserNotFound,
  final VoidCallback? onWrongPassword,
}) async {
  final _firebaseAuth = FirebaseAuth.instance;
  late UserCredential userCredential;
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
    }
  }
  return userCredential;
}
