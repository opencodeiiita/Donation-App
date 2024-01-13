
import 'dart:ui';

import 'package:donation_app/src/features/authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'imageslider.dart';
FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
// Dimensions in physical pixels (px)
Size size = view.physicalSize / view.devicePixelRatio;
double w = size.width;
double h = size.height;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override

  late PageController _pageController;
  @override
  void initState() {
    _pageController= PageController(initialPage: 0);
    super.initState();
  }

  @ override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:[
              Expanded(
                child: PageView.builder(
                  itemCount: demo_data.length,
                  controller: _pageController,
                  itemBuilder: (context,index)=>OnboardContent(
                    specialwidget: demo_data[index].widget,
                    title: demo_data[index].title,
                    description: demo_data[index].description,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SmoothPageIndicator(
                    controller: _pageController,  // PageController
                    count:  demo_data.length,
                    effect:  const ExpandingDotsEffect(
                      spacing:  5.0,
                      radius:  5.0,
                      dotWidth:  10.0,
                      dotHeight:  10.0,
                      strokeWidth:  10,
                      dotColor:  Color.fromARGB(255, 174, 182, 210),
                      activeDotColor:  Color.fromARGB(255, 32, 159, 166),
                    ),
                ),
              ),
              Container(
                width: 80,
                height:80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromARGB(255, 32, 159, 166),
                    width: 0.5,
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 32, 159, 166),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _pageController.page!=demo_data.length-1?
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                        ):Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnBoard extends StatelessWidget {
  const OnBoard({super.key, required this.title, required this.description,required this.widget});
  final String title,description;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


final List<OnBoard> demo_data=[
  OnBoard(
    widget: Container(
      height: h*0.5,
      child: Image.asset(fit: BoxFit.cover,"assets/images/screen1.png"),
    ),
    title: "Let's Help\nEach Other",
    description: "When we give cheerfully and accept\ngratefully, everyone is blessed",
  ),
  OnBoard(
    widget: Container(
      height: h*0.5,
      child: Image.asset(fit: BoxFit.cover,"assets/images/screen2.png"),
    ),
    title: "We Can Help\nPoor People",
    description: "When we give cheerfully and accept\ngratefully, everyone is blessed",
  ),
  const OnBoard(
    widget: ImageSlider(),
    title: "We Can Help\nPoor People",
    description: "When we give cheerfully and accept\ngratefully, everyone is blessed",
  ),
];


class OnboardContent extends StatelessWidget {
  const OnboardContent({super.key, required this.specialwidget, required this.title, required this.description});

  final String title,description;
  final Widget specialwidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        specialwidget,
        const Spacer(),
        Text(
          title ,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 26, 36, 65),
                fontWeight: FontWeight.w500,
              )),
          textAlign: TextAlign.center,
        ),
        Text(
          description,
          style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 174, 182, 199),
                fontWeight: FontWeight.normal,
              )),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}

