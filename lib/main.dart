import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tcc_app/view/pages/home/login_page.dart';
import 'firebase_options.dart';

import 'view/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("sensor").doc("sensor1").set({
    "name": "sensor1",
    "value": 2,
  });
}
