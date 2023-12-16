import 'package:donation_app/home_activity.dart';
import 'package:donation_app/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString("email");
    String? phoneNumber = prefs.getString("phonenumber");

    return email != null && phoneNumber != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          bool isLoggedIn = snapshot.data ?? false;

          if (isLoggedIn)
            return HomeActivity();
          else
            return LoginScreen();
        }
      },
    );
  }
}
