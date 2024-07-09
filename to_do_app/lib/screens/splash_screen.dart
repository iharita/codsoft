import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/screens/first_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    // Start a timer to change the screen after 3 seconds
    Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const FirstScreen()));
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.lightbulb_outline,
            size: 70,
            color: whiteColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()));
              },
              child: Text(
                "HABITA",
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.cinzel().fontFamily),
              ),
            ),
          )
        ],
      ),
    );
  }
}
