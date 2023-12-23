import 'dart:ffi';

import 'package:donation_app/main.dart';
import 'package:donation_app/side_Menu.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:donation_app/feed_fragment.dart';
import 'package:donation_app/main.dart';
import 'menubutton.dart';
import 'package:rive/rive.dart';
import 'package:donation_app/utils/riveutils.dart';


class HomepageStack extends StatefulWidget {
  const HomepageStack({super.key});

  @override
  State<HomepageStack> createState() => _HomepageStackState();
}

class _HomepageStackState extends State<HomepageStack> with SingleTickerProviderStateMixin
{

  late SMIBool isSideBarClosed;
  bool isSideMenuClosed=true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;

  @override
  void initState() {
    // TODO: implement initState

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
      setState(() {});
    });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController
          , curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(parent: _animationController
          , curve: Curves.fastOutSlowIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,32,159,166),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            child: SideMenu(),
            width: 270,
            left: isSideMenuClosed ? -288 : 0 ,
            height: MediaQuery.of(context).size.height,
          ),
          Transform.translate(
              offset: Offset(animation.value*270,0),
              child: Transform.scale(
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(isSideMenuClosed?0:24)),
                    child: HomeActivity(
                    ),
                ),
                scale: scalAnimation.value,
              )
          ),
          MenuBtn(
            press: (){
              if (isSideMenuClosed) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
              setState(() {
                isSideMenuClosed =!isSideMenuClosed;
              });
            },
          ),


        ],
      ),

    );
  }
}
