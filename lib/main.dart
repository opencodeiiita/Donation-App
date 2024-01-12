import 'package:donation_app/baseHomeActivity.dart';
import 'package:donation_app/donationcart/mydonationbox.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'splash.dart';
import 'loginPage.dart';
import 'signup_screen.dart';
import 'feedPage.dart';
import 'donations_fragment.dart';
import 'profilePage.dart';
import 'firebase_options.dart';


/*
this is the homepage which contains the bottom nav bar and other stuff
 */

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    home: Splash_Screen(),
    // home: MyDonationBox(),
    debugShowCheckedModeBanner: false,
  ));
}

