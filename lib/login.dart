import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          backgroundColor: Color.fromRGBO(219, 136, 224, 1),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter phone number",
                  style: TextStyle(fontSize: 20),
                ),
                // SizedBox(
                //   height: 6,
                // ),
                Container(
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Phone number',
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Text(
                  "Enter email id",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email id',
                      border: const UnderlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromRGBO(219, 136, 224, 1),
                        ),
                      ),
                    ))
              ],
            )));
  }
}
