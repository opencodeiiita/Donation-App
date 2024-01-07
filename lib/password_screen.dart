import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/profile_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordScreen extends StatefulWidget {
  final String email;

  const PasswordScreen(this.email, {super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset(
                  'assets/help.png',
                  width: 70,
                  height: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  'assets/line.png',
                  width: 60,
                  height: 60,
                ),
              )
            ], //
          ),
          const SizedBox(height: 100),
          // Text(widget.email),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                const Text(
                  "Enter Password",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 80),
                TextField(
                  controller: confirmPasswordController,
                  textAlign: TextAlign.left,
                  obscureText: _obscureText,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      focusColor: Colors.grey[100],
                      hintText: 'Confirm Password',
                      hintStyle: GoogleFonts.poppins(),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            width: 0.2,
                          )),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 32, 159, 166),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.all(20),
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _toggle,
                      )),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: passwordController,
                  textAlign: TextAlign.left,
                  obscureText: _obscureText,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                      focusColor: Colors.grey[100],
                      hintText: 'Enter Password',
                      hintStyle: GoogleFonts.poppins(),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          borderSide: BorderSide(
                            width: 0.2,
                          )),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 32, 159, 166),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      suffixIcon: IconButton(
                        padding: const EdgeInsets.all(20),
                        icon: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: _toggle,
                      )),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: ElevatedButton(
                    onPressed: () async {
                      String? uid = await createAccount();
                      if (uid != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSetup(uid),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF209FA6),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                    child: const Text('Continue',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> createAccount() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: widget.email,
        password: passwordController.text,
      );
      FirebaseFirestore db = FirebaseFirestore.instance;
      await db.collection('users').doc(credential.user!.uid).set({
        'email': credential.user!.email,
        'displayName': '',
        'photoURL': '',
      });
      return credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Fluttertoast.showToast(
          msg: 'The password provided is too weak.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFF209FA6),
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return null;
      } else if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
          msg: 'The account already exists for that email.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFF209FA6),
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return null;
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      return null;
    }
  }
}
