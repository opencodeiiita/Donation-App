import 'user.dart';

class Login {
  List<User> users;

  Login(this.users);

  bool loginUser(String username, String password) {
    // Check if the user exists
    User user = users.firstWhere((user) => user.username == username, orElse: () => null);

    if (user == null) {
      print('User not found. Please check your username.');
      return false;
    }

    // Check if the password is correct
    if (user.password == password) {
      print('Login successful. Welcome back, $username!');
      return true;
    } else {
      print('Incorrect password. Please try again.');
      return false;
    }
  }
}
