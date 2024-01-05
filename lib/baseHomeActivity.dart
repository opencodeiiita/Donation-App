
import 'package:donation_app/feedPage.dart';
import 'package:donation_app/main.dart';
import 'package:donation_app/hamburgerMenu.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'hamburger_function.dart';


/*
this page is responsible for the homeactivity and the hamburger transtition
 */

class basehomeActivity extends StatefulWidget {
  const basehomeActivity({super.key});

  @override
  State<basehomeActivity> createState() => _basehomeActivityState();
}

class _basehomeActivityState extends State<basehomeActivity> with SingleTickerProviderStateMixin
{

  late SMIBool isSideBarClosed;
  bool isSideMenuClosed=true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  late Animation<double> borderanimation;

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
    borderanimation = Tween<double>(begin: 0, end: 24).animate(
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
      backgroundColor: const Color.fromARGB(255,32,159,166),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 270,
            left: isSideMenuClosed ? -288 : 0 ,
            height: MediaQuery.of(context).size.height,
            child: hamburgerMenu(
              pressa: (){
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
          ),
          Transform.translate(
              offset: Offset(animation.value*270,0),
              child: Transform.scale(
                scale: scalAnimation.value,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(borderanimation.value)),
                    child: feedPage(
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
                ),
              )
          ),
        ],
      ),

    );
  }
}
