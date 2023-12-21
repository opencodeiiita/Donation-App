import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign In',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: 1.0,
          ),
          child: child!,
        );
      },
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/help.png',
                  width: 50.0,
                  height: 50.0,
                ),
                const SizedBox(width: 165.0),
                Image.asset(
                  'assets/line.png',
                  width: 40.0,
                  height: 40.0,
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25.0),
            Container(
              width: 250.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 252, 252),
                border: Border.all(
                  color: Color.fromARGB(255, 217, 241, 252),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Your Email',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Container(
              width: 250.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 252, 252),
                border: Border.all(
                  color: Color.fromARGB(255, 217, 241, 252),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(257.0, 55.0),
                backgroundColor: Color.fromARGB(255, 32, 159, 166),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'or continue with',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/apple_logo.png',
                    height: 24.0,
                    width: 24.0,
                  ),
                  label: Text(
                    'Sign in with Apple',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(257.0, 55.0),
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color.fromARGB(255, 217, 241, 252),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/google_logo.png',
                    height: 24.0,
                    width: 24.0,
                  ),
                  label: Text(
                    'Sign in with Google',
                    style: TextStyle(color: Colors.blue),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                    minimumSize: const Size(257.0, 55.0),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color.fromARGB(255, 217, 241, 252),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'New User?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 159, 166),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
