import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
        leading: BackButton(),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'History Page',
        ),
      ),

    );
  }
}
