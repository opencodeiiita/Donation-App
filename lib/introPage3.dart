import 'dart:async';
import 'package:donation_app/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class introPage3 extends StatelessWidget {
  const introPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const ImageSlider(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                'Everyone Can Help Someone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B2440),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            // Add some space between the text
            const SizedBox(height: 40),
            // Sub heading Text
            Text(
              'When we give cheerfully and accept gratefully, everyone is blessed.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFFA6AFC2),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Get Started Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                    (_) => false);
              },
              // Set wisth of elevated button to 80% of screen width
              style: ElevatedButton.styleFrom(
                // Increase font size
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                // Change font

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                padding: const EdgeInsets.all(30),
                backgroundColor: const Color(0xFF209FA6),
                foregroundColor: Colors.white,
              ),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int currentIndex = 0;
  List<String> images = [
    "asian_girl.jpg",
    "children.jpg",
    "old_man.jpg",
    "wheelchair.jpg",
    "african_child.jpg",
    "african2.jpg",
  ];
  Image _image = Image.asset("assets/images/asian_girl.jpg");

  @override
  void initState() {
    super.initState();
    startImageSlider();
  }

  void startImageSlider() {
    const Duration duration = Duration(seconds: 3);

    Timer.periodic(duration, (Timer timer) {
      if (!mounted) {
        return;
      }

      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
        _image = Image.asset("assets/images/${images[currentIndex]}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
      height: MediaQuery.of(context).size.height * 0.45,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: Image(
            image: _image.image,
            key: ValueKey<Image>(_image),
          ),
        ),
      ),
    );
  }
}
