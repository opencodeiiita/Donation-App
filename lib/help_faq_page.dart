import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & FAQ", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
        leading: BackButton(),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'Help and FAQ Page',
        ),
      ),

    );
  }
}
