import 'user.dart';

class Login {
  List<User> users;

  Login(this.users);

  bool loginUser(String username, String password) {
    // Check if the user exists
    User user = users.firstWhere(
          (user) => user.username == username,
       // Set the return type of orElse explicitly to User
    );

    // Check if the user exists and if the password is correct
    if (user.password == password) {
      print('Login successful. Welcome back, $username!');
      return true;
    } else {
      print('Incorrect username or password. Please try again.');
      return false;
    }
  }
}
