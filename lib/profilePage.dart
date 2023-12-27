import 'package:flutter/material.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 250, 255),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 1, color: Colors.lightBlueAccent),
      ),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/screen1.png',
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    child: const Text(
                      'Education Dono for poor child',
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(child: SizedBox(),flex:1,),
              ],
            ),
            Text(
              'By IIITA',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: const Text(
                        '\$ 4525 Raised ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 32, 159, 166),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: const Text(
                        'Target-\$10000',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
