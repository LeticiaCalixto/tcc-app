import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tcc_app/view/pages/home/home_page.dart';
import 'package:tcc_app/view/pages/home/login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Verify if user is logged in
  final firebaseAuth = FirebaseAuth.instance;
  final user = firebaseAuth.currentUser;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Visibility(
        visible: user != null,
        replacement: const LoginPage(),
        child: const HomePage(),
      ),
    ),
  );
}
