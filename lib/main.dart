import 'package:flutter/material.dart';
import 'splash.dart';
import 'login.dart';
import 'signup_screen.dart';
import 'feed_fragment.dart';
import 'donations_fragment.dart';
import 'profile_fragment.dart';

void main() {
  runApp(const MaterialApp(
    // home: SideMenu(),
    home: Splash_Screen(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    const FeedFragment(),
    const DonationsFragment(),
    const ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: _fragments[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Donations',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/login') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MyLogin(),
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
                const SignUpScreen(),
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
                const FeedFragment(),
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
        return null;
        // Add other routes here
      },
    );
  }
}
