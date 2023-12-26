
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loginPage.dart';

const tealLikeColor = Color.fromARGB(255, 32, 159, 166);
const whiteg =Color.fromARGB(255,222,240,241);


/*
this screen cotains all the buttons and code responsible for hte hamburrger menu
 */
class hamburgerMenu extends StatefulWidget {
  const hamburgerMenu({super.key});

  @override
  State<hamburgerMenu> createState() => _hamburgerMenuState();
}

class _hamburgerMenuState extends State<hamburgerMenu> {
  static const IconData logout_rounded = IconData(0xf88b, fontFamily: 'MaterialIcons');
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
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 100, 0, 0),
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
                padding: EdgeInsets.fromLTRB(15,0,0,40),
                child: Text('hellobesnik@gmail.com',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255,141,208,211)
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: const Text(
                  'Create Fund',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: const Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: const Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 16,
                    color: whiteg,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
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
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const loginPage()),
                      );
                    },
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0,0,10,0),
                          child: Text('LogOut',style: TextStyle(color: Color.fromARGB(255,222,240,241),fontSize: 16),),
                        ),
                        Icon(logout_rounded,color: whiteg,),
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
