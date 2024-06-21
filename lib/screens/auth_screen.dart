import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_ai/screens/Instruction_page.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "MedAI",
            style: TextStyle(
              fontFamily: 'SofiaPro',
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.7,
            width: MediaQuery.sizeOf(context).width,
            child: LottieBuilder.asset("assets/image/medai intro.json"),
          ),
          SizedBox(
            height: 10,
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
                  /*  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AuthScreen()));*/
                },
                child: Text(
                  'Login with Google',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InstructionPage()));
                },
                child: Text(
                  'Login with GitHub',
                  style: TextStyle(
                      fontFamily: 'SofiaPro',
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
