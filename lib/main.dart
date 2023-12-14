import 'package:flutter/material.dart';
import 'package:donation_app/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyLogin(),
    routes: {
      'login': (context) => MyLogin(),
    },
  ));
}
