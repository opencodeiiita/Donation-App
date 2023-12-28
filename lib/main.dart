import 'package:flutter/material.dart';
import 'splash.dart';
import 'loginPage.dart';
import 'signup_screen.dart';
import 'feedPage.dart';
import 'donations_fragment.dart';
import 'profilePage.dart';



/*
this is the homepage which contains the bottom nav bar and other stuff
 */
void main() {
  runApp(const MaterialApp(
    home: Splash_Screen(),
    debugShowCheckedModeBanner: false,
  ));
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    const feedPage(),
    const DonationsFragment(),
    const profilePage(),
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
                const loginPage(),
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
                const feedPage(),
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
