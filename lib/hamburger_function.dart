import 'package:flutter/material.dart';

class hamburger_function extends StatelessWidget {
  const hamburger_function({super.key, required this.press});

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 21, 0, 0),
      child: SafeArea(
            child: GestureDetector(
              onTap: press,
              child: Container(
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20),
                      right: Radius.circular(20),
                    ),
                  ),
                  color: Color.fromARGB(255, 32, 159, 166),
                ),
                child: IconButton(
                    onPressed: press,
                    icon: const Icon(Icons.menu, color: Colors.white)),
              ),
              ),
          ),
    );
  }
}
