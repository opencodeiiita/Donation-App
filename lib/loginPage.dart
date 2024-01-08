import 'package:donation_app/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'baseHomeActivity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
/*
this is the screen responsible for handling of the login actvity

this page also conatins the code of the sign in activity to oo
 */

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  _loginPageState createState() => _loginPageState();
}

Future<void> signInUser(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-email') {
      Fluttertoast.showToast(msg: 'Email format is incorrect!');
    } else if (e.code == 'invalid-credential') {
      Fluttertoast.showToast(msg: 'Invalid Credentials');
    }
    Fluttertoast.showToast(msg: "ERROR! Please try after some time");
    throw e;
  }
}

Future<void> signInUserGoogle() async {
  try {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
    await FirebaseAuth.instance.signInWithCredential(credential);
    final User? user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection("users").doc(user?.uid).set({
      "email": user?.email,
      "displayName": user?.displayName,
      "photoURL": user?.photoURL,
    });
  } on FirebaseAuthException catch (e) {
    Fluttertoast.showToast(msg: "ERROR! Please try after some time");
    throw e;
  }
}

class _loginPageState extends State<loginPage> {
  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40, // Adjust the height as needed
            child: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
            ),
          ),
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
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      const Text('Sign In',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 35),
                      Container(
                        height: 55,
                        child: TextField(
                          controller: emailController,
                          textAlign: TextAlign.center,
                          cursorColor: const Color.fromARGB(255, 32, 159, 166),
                          decoration: InputDecoration(
                            focusColor: Colors.grey[100],
                            hintText: 'Your Email',
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 55,
                        child: TextField(
                          controller: passwordController,
                          textAlign: TextAlign.center,
                          cursorColor: const Color.fromARGB(255, 32, 159, 166),
                          decoration: InputDecoration(
                            focusColor: Colors.grey[100],
                            hintText: 'Password here',
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
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'Please enter both email and password.');
                              return;
                            }
                            signInUser(emailController.text,
                                    passwordController.text)
                                .then((_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => basehomeActivity()),
                              );
                            }).catchError((error) {
                              print(error);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF209FA6),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          child: const Text('Continue',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'or continue with',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 20),
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.apple,
                          backgroundColor: Colors.white,
                          borderRadius: 20,
                          onPressed: () {
                            // APPLE BUTTON
                          }),
                      const SizedBox(height: 20),
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          backgroundColor: Colors.white,
                          borderRadius: 20,
                          onPressed: () {
                            signInUserGoogle().then((_) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => basehomeActivity()),
                              );
                            }).catchError((error) {
                              print(error);
                            });
                          }),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User? ',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: const Text('Create Account',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 32, 159, 166))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
