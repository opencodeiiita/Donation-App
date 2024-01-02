import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:donation_app/twoscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Splash_Screen extends StatelessWidget {
  const Splash_Screen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Text('Help',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400,
                    fontSize: 60))),
        backgroundColor: const Color.fromARGB(255, 32, 159, 166),

        //Color(RGBA(32,159,166,255))
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: const TwoScreen());
  }
}
