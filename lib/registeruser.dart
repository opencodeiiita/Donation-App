import 'user.dart';

class Registration {
  List<User> users = [];

  bool registerUser(String username, String password) {
    // Check if the username is already taken
    if (users.any((user) => user.username == username)) {
      print('Username already taken. Please choose a different one.');
      return false;
    }

    // If the username is not taken, register the user
    User newUser = User(username, password);
    users.add(newUser);
    print('Registration successful. Welcome, $username!');
    return true;
  }
}
