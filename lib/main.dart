import 'package:donation_app/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen()
        // Scaffold(
        //   backgroundColor: Colors.white,

        );
  }
}
