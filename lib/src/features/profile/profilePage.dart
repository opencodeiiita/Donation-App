import 'package:donation_app/src/features/profile/achievements_screen.dart';
import 'package:donation_app/src/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> with SingleTickerProviderStateMixin{

  late TabController _tabController ;

  @override
  void initState(){
    _tabController = new TabController(length: 2, vsync: this,initialIndex: 0)..addListener(() {
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.w600),),
        leading: BackButton(),
        backgroundColor: Colors.white,
        bottom: TabBar(
          tabs: [
            Tab(child: Text("Profile",style: TextStyle(fontSize: 18),),),
            Tab(child: Text("Achievemenats",style: TextStyle(fontSize: 18),),),
          ], indicatorColor: Color.fromARGB(255, 32, 159, 166),
          controller: _tabController,
          labelColor: Color.fromARGB(255, 32, 159, 166),
          indicatorSize: TabBarIndicatorSize.tab ,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ProfileScreen(),
          AchievementsScreen(),
        ],
      ),
    );
  }
}
