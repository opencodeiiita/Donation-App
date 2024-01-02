import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      home: const SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
                  'help.png',
                  width: 50.0,
                  height: 50.0,
                ),
                const SizedBox(width: 165.0),
                Image.asset(
                  'line.png',
                  width: 40.0,
                  height: 40.0,
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            const Text(
              'Verification',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter code we sent on',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 5.0),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'he******nik@gmail.com',
                    style: TextStyle(
                      color: Color.fromARGB(255, 32, 159, 166),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 53.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 252, 252),
                    border: Border.all(
                      color: const Color.fromARGB(255, 217, 241, 252),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Container(
                  width: 53.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 252, 252),
                    border: Border.all(
                      color: const Color.fromARGB(255, 217, 241, 252),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Container(
                  width: 53.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 252, 252),
                    border: Border.all(
                      color: const Color.fromARGB(255, 217, 241, 252),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Container(
                  width: 53.0,
                  height: 53.0,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 252, 252, 252),
                    border: Border.all(
                      color: const Color.fromARGB(255, 217, 241, 252),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: '',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(257.0, 55.0),
                backgroundColor: const Color.fromARGB(255, 32, 159, 166),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Resend',
                style: TextStyle(
                  color: Color.fromARGB(255, 32, 159, 166),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 90.0),
            const Text(
              'By clicking the Continue button, you agree to',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const Text(
              'the terms of service and privacy policy',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
