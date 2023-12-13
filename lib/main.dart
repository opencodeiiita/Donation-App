import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(

          child: Image.asset('assets/newlogo.jpeg'),
          // Replace "your_image.png" with the actual image filename
        ),
      ),
    );
  }
}
