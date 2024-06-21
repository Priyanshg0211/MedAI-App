import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:med_ai/firebase_options.dart';
import 'package:med_ai/screens/introscreen.dart';
import 'package:med_ai/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Med AI',
      home: SplashScreen(),
    );
  }
}

