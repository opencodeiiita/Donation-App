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
}

