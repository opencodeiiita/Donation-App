import 'package:flutter/material.dart';

class CreateFundPage extends StatelessWidget {
  const CreateFundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Fund", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
        leading: BackButton(),
        backgroundColor: Colors.white,
      ),
      body: const Center(
        child: Text(
          'create fund page',
        ),
      ),

    );
  }
}
