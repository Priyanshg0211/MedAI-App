import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:med_ai/screens/Instruction_page.dart';
import 'package:med_ai/screens/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkCurrentUser();
  }

  void _checkCurrentUser() async {
    User? user = _auth.currentUser;
    await Future.delayed(Duration(seconds: 3));
    if (user != null) {
      // If user is already authenticated, navigate to the Home screen directly
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InstructionPage()),
      );
    } else {
      // If user is not authenticated, navigate to the Onboarding screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/image/splashscreen.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
