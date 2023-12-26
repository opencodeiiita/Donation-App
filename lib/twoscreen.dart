import 'package:donation_app/introPage3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TwoScreen extends StatefulWidget {
  const TwoScreen({super.key});

  @override
  _TwoScreenState createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: [
        PageScreen(
            image: 'assets/images/screen1.png',
            titl1: "Let's Help",
            titl2: "Each Others",
            next: () {
              _pageController.animateToPage(
                1,
                duration: const Duration(
                    milliseconds:
                        1000), // You can adjust the duration as needed
                curve: Curves.ease,
              );
            }),
        const PageScreen(
            image: 'assets/images/screen2.png',
            titl1: "We Can Help",
            titl2: 'Poor People',
            next: null)
      ],
    ));
  }
}

class PageScreen extends StatelessWidget {
  final String image;
  final String titl1;
  final String titl2;
  final Function? next;

  const PageScreen(
      {super.key,
      required this.image,
      required this.titl1,
      required this.titl2,
      required this.next});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(image)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  titl1,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 26, 36, 65),
                    fontWeight: FontWeight.w500,
                  )),
                  textAlign: TextAlign.center,
                ),
                Text(
                  titl2,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 45,
                    color: Color.fromARGB(255, 26, 36, 65),
                    fontWeight: FontWeight.w500,
                  )),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'When we give cheerfully and accept',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 174, 182, 199),
                    fontWeight: FontWeight.normal,
                  )),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'gratefully, everyone is blessed',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 174, 182, 199),
                    fontWeight: FontWeight.normal,
                  )),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
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
                    if (next != null) {
                      next!();
                    } else {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const introPage3()),
                          (_) => false);
                    }
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
    );
  }
}
