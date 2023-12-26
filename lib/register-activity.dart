import 'package:flutter/material.dart';

void main() {
  runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Activity',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterScreen(),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text(
              'Register',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
            elevation: 0, // Remove shadow
            iconTheme: const IconThemeData(color: Colors.white), // Color of the back button
          ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade400],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 40.0),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    // logic
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue, backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: const Text('Register'),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Or sign up using',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // Perform Google sign-in action
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Image.network(
                          'data:image/png;base64,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', // Google logo URL
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    GestureDetector(
                      onTap: () {
                        // Perform Facebook sign-in action
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Image.network(
                          'data:image/png;base64,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', // Facebook logo URL
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
