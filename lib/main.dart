import 'package:donation_app/src/features/home/baseHomeActivity.dart';
import 'package:donation_app/src/features/donationcart/mydonationbox.dart';
import 'package:donation_app/src/features/intro/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'src/features/intro/screens/splash.dart';
import 'src/features/authentication/screens/loginPage.dart';
import 'src/features/authentication/screens/signup_screen.dart';
import 'src/features/home/feedPage.dart';
import 'src/features/home/donations_fragment.dart';
import 'src/features/profile/profilePage.dart';
import 'src/features/firebase/firebase_options.dart';


/*
this is the homepage which contains the bottom nav bar and other stuff
 */

import 'src/features/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: Splash_Screen(),
    // home: MyDonationBox(),
    // home: OnBoardingScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

