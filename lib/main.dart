
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
 return MaterialApp(
 home: LoginScreen(),
 onGenerateRoute: (settings) {
   if (settings.name == '/login') {
     return PageRouteBuilder(
       pageBuilder: (context, animation, secondaryAnimation) =>
           LoginScreen(),
       transitionsBuilder:
           (context, animation, secondaryAnimation, child) {
         const begin = Offset(0.0, 1.0);
         const end = Offset.zero;
         const curve = Curves.ease;

         var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

         return SlideTransition(
           position: animation.drive(tween),
           child: child,
         );
       },
     );
   } else if (settings.name == '/signup') {
     return PageRouteBuilder(
       pageBuilder: (context, animation, secondaryAnimation) =>
           SignUpScreen(),
       transitionsBuilder:
           (context, animation, secondaryAnimation, child) {
         const begin = Offset(0.0, 1.0);
         const end = Offset.zero;
         const curve = Curves.ease;

         var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

         return SlideTransition(
           position: animation.drive(tween),
           child: child,
         );
       },
     );
   } else if (settings.name == '/home') {
     return PageRouteBuilder(
       pageBuilder: (context, animation, secondaryAnimation) =>
           FeedFragment(),
       transitionsBuilder:
           (context, animation, secondaryAnimation, child) {
         const begin = Offset(0.0, 1.0);
         const end = Offset.zero;
         const curve = Curves.ease;

         var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

         return SlideTransition(
           position: animation.drive(tween),
           child: child,
         );
       },
     );
   }
   // Add other routes here
 },
 );
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

