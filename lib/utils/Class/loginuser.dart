
import '../../user.dart';

class Login {
  List<User> users;

  Login(this.users);

  bool? loginUser(String username, String password) {
    User? user = users.firstWhere((user) => user.username == username);

    if (user.password == password) {
      print('Login successful. Welcome back, $username!');
      return true;
    } else {
      print('Incorrect password. Please try again.');
      return false;
    }
  }
}
