import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import 'user.dart';

class Login {
  List<User> users;

  Login(this.users);

  bool? loginUser(String username, String password) {
    User? user = users.firstWhere((user) => user.username == username);

    if (user == null) {
      print('User not found. Please check your username.');
      return null;
    }

    if (user.password == password) {
      print('Login successful. Welcome back, $username!');
      return true;
    } else {
      print('Incorrect password. Please try again.');
      return false;
    }
  }
}
