import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donation_app/src/features/home/Donation_card.dart';
import 'package:donation_app/src/features/createfund/create_fund_page.dart';
import 'package:donation_app/src/features/home/donations_fragment.dart';
import 'package:flutter/material.dart';

/*
this screen is responsible to show the feed it is a part of the screen which are displayed by the bottomnavbar
 */

const tealLikeColor = Color.fromARGB(255, 32, 159, 166);

class feedPage extends StatefulWidget {
  const feedPage({super.key, required this.press});

  final VoidCallback press;

  @override
  State<feedPage> createState() => _feedPageState();
}

class _feedPageState extends State<feedPage> {
  final _donationstream =
      FirebaseFirestore.instance.collection('Donations').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Ink(
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                      ),
                      color: tealLikeColor,
                    ),
                    child: IconButton(
                        onPressed: widget.press,
                        icon: const Icon(Icons.menu, color: Colors.white)),
                  ),
                  Ink(
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: tealLikeColor),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: tealLikeColor,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StartFundingButton(),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CategoryButton(
                            icon: Icons.apps,
                            label: 'All',
                            color: Colors.blue,
                          ),
                          CategoryButton(
                            icon: Icons.local_hospital,
                            label: 'Medical',
                            color: Colors.teal,
                          ),
                          CategoryButton(
                            icon: Icons.school,
                            label: 'Education',
                            color: Colors.orange,
                          ),
                          CategoryButton(
                            icon: Icons.masks,
                            label: 'Pandemic',
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                              color: tealLikeColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                    StreamBuilder(
                      stream: _donationstream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text("connection error...");
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Loading...");
                        }
                        var docs = snapshot.data!.docs;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: docs.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DonationsFragment(),
                                  ),
                                );
                              },
                              child: Card(
                                color: const Color.fromARGB(255, 251, 253, 255),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(color: Colors.blue),
                                ),
                                margin:
                                    const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Container(
                                        height: 100,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(25),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              docs[index]['addImage'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              docs[index]['addTitle'],
                                              softWrap: true,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(flex: 1, child: SizedBox()),
                                        ],
                                      ),
                                      Text(
                                        "By " + docs[index]['addOrganisation'],
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.blueGrey),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '\$' +
                                                    docs[index]['addRaised']
                                                        .toString() +
                                                    ' Raised ',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 32, 159, 166),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Target-\$' +
                                                    docs[index]['addTarget']
                                                        .toString(),
                                                textAlign: TextAlign.right,
                                                style: const TextStyle(
                                                  fontSize: 16,
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
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StartFundingButton extends StatelessWidget {
  const StartFundingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: tealLikeColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 25),
          child: const Text(
            'Start Your',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 7),
          child: const Text(
            'Own Funding',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3),
          child: const Text(
            'Create Your Own Dono Post',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 15),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateFundPage(),
                ),
              );
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white,
            ),
            child: const Text(
              'Start Now',
              style: TextStyle(
                color: tealLikeColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const CategoryButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Ink(
          decoration: ShapeDecoration(
            shape: const CircleBorder(
                side: BorderSide(width: 1.5, color: Colors.white)),
            color: color.withOpacity(0.1),
          ),
          child: IconButton(
              icon: Icon(icon, size: 25),
              color: color,
              onPressed: () {
                // can make another parameter for a function to be called when pressed
              }),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
