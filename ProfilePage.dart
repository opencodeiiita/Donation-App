import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
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

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String activeTab = 'Profile';

  void switchTab(String tab) {
    setState(() {
      activeTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 120),
                Image.network(
                  'https://cdn.iconscout.com/icon/free/png-256/free-back-arrow-1767515-1502579.png',
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 20),
                Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => switchTab('Profile'),
                  style: TextButton.styleFrom(
                    primary:
                        activeTab == 'Profile' ? Colors.black : Colors.grey,
                    backgroundColor: Colors.white,
                    textStyle: activeTab == 'Profile'
                        ? TextStyle(fontWeight: FontWeight.bold)
                        : null, // Bold text for active tab
                    shape: LinearBorder.bottom(
                      side: BorderSide(
                        width: 2, // Thicker bottom border
                        color: activeTab == 'Profile'
                            ? Colors.black54
                            : Colors.transparent,
                      ),
                    ),
                    minimumSize: Size(140, 40), // Larger button size
                  ),
                  child: Text('Profile'),
                ),
                TextButton(
                  onPressed: () => switchTab('Submissions'),
                  style: TextButton.styleFrom(
                    primary:
                        activeTab == 'Submissions' ? Colors.black : Colors.grey,
                    backgroundColor: Colors.white,
                    textStyle: activeTab == 'Submissions'
                        ? TextStyle(fontWeight: FontWeight.bold)
                        : null,
                    shape: LinearBorder.bottom(
                      side: BorderSide(
                        width: 2,
                        color: activeTab == 'Submissions'
                            ? Colors.black54
                            : Colors.transparent,
                      ),
                    ),
                    minimumSize: Size(140, 40),
                  ),
                  child: Text('Submissions'),
                ),
              ],
            ),
            SizedBox(height: 10),
            ClipOval(
              child: Image.network(
                'https://i1.sndcdn.com/avatars-000677053916-urhmhp-t500x500.jpg',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const Text(
              'ABIGAIL YU',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'ABIGAILYU@GMAIL.COM',
              style: TextStyle(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: [
                Divider(height: 50, thickness: 1.5),
                Transform.translate(
                  offset: Offset(-100.0,
                      0 - 15.0), // Translate 50 units to the right (x-axis)
                  child: Text(
                    'Basic Info',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Transform.translate(
                          offset: Offset(-53.0,
                              0.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            'NAME',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-26.0,
                              0.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            'Anthony Libueze',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        width:
                            120), // Adding some space between texts and image
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/32/32213.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Transform.translate(
                          offset: Offset(-30.0,
                              25.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            'PASSWORD',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-28.0,
                              -8.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            '......',
                            style: TextStyle(
                                fontSize: 41, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        width:
                            137), // Adding some space between texts and image
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/32/32213.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ],
            ),
            Divider(height: 10, thickness: 1.5),
            Column(
              children: [
                SizedBox(height: 20),
                Transform.translate(
                  offset: Offset(-88.0,
                      0 - 15.0), // Translate 50 units to the right (x-axis)
                  child: Text(
                    'Contact Info',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Transform.translate(
                          offset: Offset(-55.0,
                              0.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            'EMAIL',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-19.0,
                              0.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            'anthony@gmail.com',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        width:
                            105), // Adding some space between texts and image
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/32/32213.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Transform.translate(
                          offset: Offset(-34.0,
                              0.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            'PHONE',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-18.0,
                              0.0), // Translate 50 units to the right (x-axis)
                          child: Text(
                            '08039347382',
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                        width:
                            140), // Adding some space between texts and image
                    Image.network(
                      'https://cdn-icons-png.flaticon.com/512/32/32213.png',
                      width: 15,
                      height: 15,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                    color: const Color.fromARGB(255, 40, 156, 164),
                    height: 43,
                    child: Row(
                      children: [
                        SizedBox(width: 150),
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1946/1946488.png',
                          width: 23,
                          height: 23,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 60),
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/1159/1159627.png',
                          width: 23,
                          height: 23,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 60),
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3106/3106773.png',
                          width: 23,
                          height: 23,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
