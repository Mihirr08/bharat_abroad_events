import 'package:bharat_abroad_events/theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String groupValue = "Home";

  late VideoPlayerController _controller;

  ScrollController scrollController = ScrollController();

  GlobalKey ourMissionKey = GlobalKey(debugLabel: "Our Mission");

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/video/topVideo.mp4")
      ..initialize().then((value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print("Initialized");
          setState(() {});
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor:
            Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
        drawer: Drawer(
          width: MediaQuery.of(context).size.width * 0.3,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 0.0, top: 34, right: 8, bottom: 0),
            child: StatefulBuilder(builder: (context, sst) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("Bharat Abroad Events",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                                color: Theme.of(context).colorScheme.secondary,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18.0),
                    child: getListWidget(text: "Home"),
                  ),
                  getListWidget(
                      text: "Our Mission",
                      onTap: () {
                        Scrollable.ensureVisible(ourMissionKey.currentContext!);
                      }),
                  getListWidget(text: "About us"),
                  getListWidget(text: "Gallery"),
                  getListWidget(text: "Our Sponsors"),
                ],
              );
            }),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              opacity: 0.05,
              image: AssetImage("assets/logo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Builder(builder: (context) {
            return CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12))),
                  pinned: false,
                  leading: IconButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(Icons.menu)),
                  title: Row(
                    children: [
                      Image.asset(
                        "assets/logo.png",
                        width: 40,
                        height: 40,
                      ),
                      Expanded(
                        child: Text(
                          "Bharat Abroad Events",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        // height: MediaQuery.of(context).size.height,
                        child: _controller.value.isInitialized
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: AspectRatio(
                                        aspectRatio:
                                            _controller.value.aspectRatio,
                                        //16/9,
                                        child: VideoPlayer(_controller))),
                              )
                            : Container(
                                color: Colors.red, width: 100, height: 100),
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: OurMissionWidget(key: ourMissionKey),
                      ),

                      const SizedBox(height: 40),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0),
                        child: OurVisionWidget(),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      );
    });
  }

  Widget getListWidget({required String text, Function()? onTap}) {
    return ListTile(
      onTap: () {
        groupValue = text;
        if (onTap != null) {
          onTap();
        }
        Navigator.pop(context);
      },
      title: MediaQuery.of(context).size.width < 500
          ? Icon(Icons.home)
          : Text(text,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
      trailing: AnimatedContainer(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: text == groupValue
              ? Theme.of(context).backgroundColor
              : Colors.transparent,
        ),
        duration: const Duration(seconds: 300),
      ),
    );
  }
}

class OurMissionWidget extends StatelessWidget {
  const OurMissionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Our Mission",
                style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const Text(
          '''Bharat Abroad Events Crop. is dedicated to showcasing the vibrant tapestry of Indian culture in the West. We strive to create culturally immersive events that serve as a dynamic platform for small and medium business, fostering growth and excellence while celebrating the rich heritage of Bharat''',
          style: TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class OurVisionWidget extends StatelessWidget {
  const OurVisionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Our Vision",
                style: TextStyle(
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const Text(
          '''We envision Bharat Abroad Events Corp. as a catalyst for bridging cultures, where the beauty and diversity of Indian traditions flourish in Western setttings. Through our innovative events, we aim to create a global stage that not only showcases the essence of India but also propels small and medium businesses to new heights of success.''',
          style: TextStyle(fontSize: 18, color: Colors.black),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
