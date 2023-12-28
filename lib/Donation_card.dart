import 'package:flutter/material.dart';

class DonationCard extends StatefulWidget {
  const DonationCard({super.key});

  @override
  State<DonationCard> createState() => _DonationCardState();
}

class _DonationCardState extends State<DonationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 251, 253, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.blue,),
      ),
      margin: const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
      child: Padding(
        padding:  const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
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
            const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    'Education Dono for poor child',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(flex:1,child: SizedBox(),),
              ],
            ),
            const Text(
              'By IIITA',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '\$ 4525 Raised ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 32, 159, 166),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Target-\$10000',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
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
