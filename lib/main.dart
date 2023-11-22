import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
        child: FutureBuilder(
            future: Future.delayed(const Duration(seconds: 3)),
            builder: (_, timerSnapshot) {
              if (timerSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                  body: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white,
                          Color(0xFF2F54EB),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Logo
                        Image(
                          image: AssetImage('assets/logo_tempmetter.png'),
                          width: 300,
                          // height: 200,
                        ),
                        SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ],
                    ),
                  ),
                );
              }
              return const HomePage();
            }),
      ),
    ),
  );
}
