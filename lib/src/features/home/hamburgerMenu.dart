
import 'package:donation_app/src/features/createfund/create_fund_page.dart';
import 'package:donation_app/src/features/donationcart/mydonationbox.dart';
import 'package:donation_app/src/features/home/donations_fragment.dart';
import 'package:donation_app/src/features/help_faq/help_faq_page.dart';
import 'package:donation_app/src/features/history/historypage.dart';
import 'package:donation_app/src/features/profile/profilePage.dart';
import 'package:donation_app/src/features/settings/settingspage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../authentication/screens/loginPage.dart';

const tealLikeColor = Color.fromARGB(255, 32, 159, 166);
const whiteg =Color.fromARGB(255,222,240,241);


/*
this screen cotains all the buttons and code responsible for hte hamburrger menu
 */
class hamburgerMenu extends StatelessWidget {
  const hamburgerMenu({super.key, required this.pressa});
  final VoidCallback pressa;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: tealLikeColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed:pressa ,
                  child: const Text(
                    'back',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 0, 0),
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Colors.white24,
                  child: Icon(CupertinoIcons.person,color: Colors.white,size: 45,),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15,0,0,0),
                child: Text('David William',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(15,0,0,20),
                child: Text('hellobesnik@gmail.com',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255,141,208,211)
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateFundPage(),
                    ),
                  );
                },
                child: const Text(
                  'Create Fund',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const profilePage()),
                  );
                },
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                },
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HistoryPage()),
                  );
                },
                child: const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDonationBox()),
                  );
                },
                child: const Text(
                  'Donate',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpPage()),
                  );
                },
                child: const Text(
                  'Help & FAQ',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              const Expanded(
                  flex: 1,
                  child: SizedBox()
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 30),
                child: TextButton(
                    onPressed: ()async {
                      final navigator = Navigator.of(context);
                      await FirebaseAuth.instance.signOut();
                      await GoogleSignIn().signOut();

                      navigator.pushAndRemoveUntil(MaterialPageRoute(
                          builder: (c) => const loginPage()),(route)=>false);
                    },
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,0,10,0),
                          child: Text('LogOut',style: TextStyle(color: Color.fromARGB(255,222,240,241),fontSize: 16),),
                        ),
                        Icon(IconData(0xf88b, fontFamily: 'MaterialIcons'),color: whiteg,),
                      ],
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
