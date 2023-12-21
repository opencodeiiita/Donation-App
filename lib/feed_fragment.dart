import 'package:flutter/material.dart';

const tealLikeColor = Color.fromARGB(255, 32, 159, 166);

class FeedFragment extends StatelessWidget {
  const FeedFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: SearchAndMenuWidget(),
            ),
            StartFundingButton(),
            Padding(
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
            Padding(
              padding: EdgeInsets.only(
                top: 20,
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
                      ))
                ],
              ),
            )
          ],
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
              onPressed: () {},
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
