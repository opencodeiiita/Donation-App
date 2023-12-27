import 'package:flutter/material.dart';



/*
this screen is responsible to show the feed it is a part of the screen which are displayed by the bottomnavbar
 */

const tealLikeColor = Color.fromARGB(255, 32, 159, 166);

class feedPage extends StatefulWidget {
  const feedPage({super.key});

  @override
  State<feedPage> createState() => _feedPageState();
}

class _feedPageState extends State<feedPage> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: SearchAndMenuWidget(),
              ),
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
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
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
                    Text("See All",
                        style: TextStyle(
                          color: tealLikeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                      )
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return Container(
                      height: 260,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 250, 250, 255),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 1, color: Colors.lightBlueAccent),
                      ),
                      margin: EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                      child: Padding(
                        padding:  EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              height: 100,
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image(
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
                                    child: Text(
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
                                      child: Text(
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
                                      child: Text(
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchAndMenuWidget extends StatelessWidget {
  const SearchAndMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
              onPressed: (){},
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
            onPressed: () {},
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
