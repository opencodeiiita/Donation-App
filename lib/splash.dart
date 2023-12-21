import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:donation_app/twoscreen.dart';
import 'package:flutter/material.dart';

class Splash_Screen extends StatelessWidget {
  const Splash_Screen({Key? key});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: const BoxDecoration(
    //       gradient: LinearGradient(
    //     colors: [Colors.deepOrange, Colors.orange],
    //     begin: Alignment.topLeft,
    //     end: Alignment.bottomRight,
    //   )),
    //   child: AnimatedSplashScreen(
    //     backgroundColor: Colors.transparent,
    //     splash: Align(
    //       alignment: Alignment.bottomCenter,
    //       child: Padding(
    //         padding: EdgeInsets.all(16.0), // here the value given is mostly in double data type
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             ClipRRect(
    //               borderRadius: BorderRadius.circular(100),
    //               child: Image.asset(
    //                 'assets/logo.jpg',
    //                 fit: BoxFit.cover,
    //                 width: 200,
    //                 height: 200,
    //               ),
    //             ),
    //             SizedBox(
    //               height: 120,
    //             ),
    //             const Text(
    //               '"Connect, Donate, Change Lives"',
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.white,
    //                   fontStyle: FontStyle.italic,
    //                   shadows: [
    //                     Shadow(
    //                         color: Colors.black,
    //                         offset: Offset(6, 6),
    //                         blurRadius: 15)
    //                   ]),
    //               textAlign: TextAlign.center,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //     splashIconSize: 400,
    //     nextScreen: const MyLogin(),
    //     duration: 3000,
    //     splashTransition: SplashTransition.scaleTransition,
    //     pageTransitionType: PageTransitionType.leftToRight,
    //   ),
    // );
    return AnimatedSplashScreen(
        splash: Container(
          child: Text('Help',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: 60)),
        ),
        backgroundColor: Color.fromARGB(255, 32, 159, 166),

        //Color(RGBA(32,159,166,255))
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: TwoScreen() );
  }
}
