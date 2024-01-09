import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.grey,
            child: Icon(CupertinoIcons.person,color: Colors.white,size: 45,),
          ),
        ),
        const Expanded(
          child: Text('David William',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
            ),
          ),
        ),
        const Expanded(
          child: Text('hellobesnik@gmail.com',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(color: Color.fromARGB(255, 32, 159, 166),),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Basic Info',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NAME',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text('Parth Revanwar',
                      style: TextStyle(

                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    )
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PASSWORD',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text('*********',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    )
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Color.fromARGB(255, 32, 159, 166),),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Contact Information',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EMAIL',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text('hellobesnik@gmail.com',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    )
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('PHONE',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    Text('7564895214',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    )
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.white),
      ],
    );
  }
}
