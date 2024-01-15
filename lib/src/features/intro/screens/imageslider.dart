import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
// Dimensions in physical pixels (px)
Size size = view.physicalSize / view.devicePixelRatio;
double w = size.width;
double h = size.height;

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
      height: h*0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1),
          child: Image(
            image: _image.image,
            fit: BoxFit.fill,
            key: ValueKey<Image>(_image),
          ),
        ),
      ),
    );
  }
}
