import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:med_ai/firebase_options.dart';
import 'package:med_ai/screens/introscreen.dart';

void main() async {
  // Ensure Widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Med AI',
      home: IntroScreen(),
    );
  }
}

