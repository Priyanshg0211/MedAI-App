import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
              Container(
                height: MediaQuery.sizeOf(context).height*0.8,
                width: MediaQuery.sizeOf(context).width*0.6,
                child: Image.asset("assets/image/medailogo.png"),
              ),
            Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    onPressed: () {
                     /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Onboardingone()));*/
                    },
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontFamily: 'SofiaPro',
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}