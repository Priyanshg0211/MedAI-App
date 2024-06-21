import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:med_ai/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  await disableScreenshots();
}

// User Cannot take Screenshot of app
Future<void> disableScreenshots() async {
  try {
    await FlutterWindowManager.addFlags(
      FlutterWindowManager.FLAG_SECURE
    );
    print('Screenshots disabled');
  } catch (e) {
    print('Failed to disable screenshots: $e');
  }
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

