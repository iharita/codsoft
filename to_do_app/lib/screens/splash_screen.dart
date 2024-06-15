import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/app_colors.dart';
import 'package:to_do_app/screens/home_view.dart';
import 'package:to_do_app/screens/login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondprimaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.lightbulb_outline,
            size: 70,
            color: secondprimaryLightColor,
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
                        builder: (context) => const HomeView()));
              },
              child: Text(
                "HABITA",
                style: TextStyle(
                    color: secondprimaryLightColor,
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
