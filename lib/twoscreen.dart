import 'package:flutter/material.dart';
import 'package:donation_app/login.dart';

class TwoScreen extends StatefulWidget {
  @override
  _TwoScreenState createState() => _TwoScreenState();
}

class _TwoScreenState extends State<TwoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          buildPage(
            images: [
              'assets/images/asian_girl.jpg',
              'assets/images/asian_girl.jpg',
              'assets/images/asian_girl.jpg',
              'assets/images/asian_girl.jpg',
            ],
            title: 'We Can help poor people',
            description: 'When we give cheerfully and accept gratefully, everyone is blessed',
          ),
        ],
      ),
    );
  }

  Widget buildPage({required List<String> images, required String title, required String description, Widget? nextPage}) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: images.length == 4 ? 2 : 4,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        images[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: images.length,
              shrinkWrap: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DefaultTextStyle(
                  style: const TextStyle(fontSize: 24, color: Colors.lightBlue, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                  child: Text(title),
                ),
                const SizedBox(height: 10),
                DefaultTextStyle(
                  style: const TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                  child: Text(description),
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black, 
                width: 2.0, 
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 32, 159, 166),
                ),
                child: IconButton(
                  onPressed: () {
                    if (nextPage != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => nextPage),
                      );
                    } else {
                      navigateToDefaultPage();
                    }
                  },
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToDefaultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => buildPage(
          images: [
            'assets/images/asian_girl.jpg',
            'assets/images/asian_girl.jpg',
            'assets/images/asian_girl.jpg',
            'assets/images/asian_girl.jpg',
            'assets/images/asian_girl.jpg',
            'assets/images/asian_girl.jpg',
            'assets/images/asian_girl.jpg',
            'assets/images/asian_girl.jpg',
          ],
          title: "Let's Help Each Other",
          description: 'When we give cheerfully and accept gratefully, everyone is blessed',
          nextPage: MyLogin(),
        ),
      ),
    );
  }
}
