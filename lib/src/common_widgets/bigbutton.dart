import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({super.key, required this.press, required this.buttonname});
  final VoidCallback press;
  final String buttonname;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF209FA6),
          shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(20)),
          ),
        ),
        child: Text(buttonname,
            style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
