
import 'package:donation_app/splash.dart';
import 'package:donation_app/login.dart';
import 'package:flutter/material.dart';
import 'feed_fragment.dart';
import 'donations_fragment.dart';
import 'profile_fragment.dart';

void main() {
  runApp(MaterialApp(
    home: Splash_Screen(),
  ));
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    FeedFragment(),
    DonationsFragment(),
    ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {



    return MaterialApp(home: LoginScreen()
        // Scaffold(
        //   backgroundColor: Colors.white,
        

        );

  }
}
