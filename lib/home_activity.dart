import 'package:donation_app/donations_fragment.dart';
import 'package:donation_app/feed_fragment.dart';

import 'package:donation_app/profile_fragment.dart';
import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({Key? key}) : super(key: key);

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 0;

  final List<Widget> _fragments = [
    FeedFragment(),
    DonationsFragment(),
    ProfileFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Activity'),
      ),
      body: _fragments[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Donations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
