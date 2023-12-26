import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DonationsFragment extends StatelessWidget {
  const DonationsFragment({super.key});


  // i think this is the page should not contain this code as it is just  screen which is holding the data , it cannot show donation details
  // as the donation detaliss are show by the DonationDetails.dart file

  static List random_images = [
    'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
    'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
    'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaOjCZSoaBhZyODYeQMDCOTICHfz_tia5ay8I_k3k&s'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Color(0xff1A2441), fontSize: 14.0),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Share',
                    style: TextStyle(color: Color(0xff1A2441), fontSize: 14.0),
                  ),
                ),
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 270,
                        width: 180,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: const NetworkImage(
                                  'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.darken),
                            ),
                            borderRadius: BorderRadius.circular(30)),
                        child: const Center(
                          child: Text(
                            "10+ \nImage",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        height: 270,
                        width: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: const VideoPlayerWidget(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Education",
                    style: TextStyle(fontSize: 16, color: Color(0xff209fa6)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Education Dono for Poor Child",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                              softWrap: true,
                            ),
                            Text(
                              "20 days left",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff9ca5bb),
                                  fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < random_images.length; i++)
                            Container(
                                margin: const EdgeInsets.symmetric(horizontal: 0),
                                child: Align(
                                  heightFactor: 0.75,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage: NetworkImage(
                                      random_images[i],
                                    ),
                                  ),
                                )),
                          Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: const Align(
                                heightFactor: 0.5,
                                child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Color(0xff209fa6),
                                    child: Text(
                                      "25",
                                      style: TextStyle(
                                          fontSize: 8, color: Colors.white),
                                    )),
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff209fa6),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(
                                Icons.my_location,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Target Amount",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff9ca5bb),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "\$10.000",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: const Color(0xff209fa6),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Icon(
                                Icons.my_location,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Raised",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff9ca5bb),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "\$10.000",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
                        ),
                      ),
                      Text(
                        " by ",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        "NCAPA",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color(0xff209fa6),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                    style: TextStyle(fontSize: 16),
                    softWrap: true,
                  ),
                ],
              ),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 70,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff209fa6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Donate',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const VideoPlayerScreen();
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(children: [
                VideoPlayer(_controller),
                Center(
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // If the video is playing, pause it.
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            // If the video is paused, play it.
                            _controller.play();
                          }
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: const Color(0xff209fa6),
                      ),
                    ),
                  ),
                )
              ]));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
