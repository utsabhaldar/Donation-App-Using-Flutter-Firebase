import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/bottom_nav_provider.dart';
import 'ButtonNavPages/Image/image.dart';
import 'ButtonNavPages/Video/video.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  // String _fileText = "";
  final globalKey = GlobalKey<ScaffoldState>();
  List<Widget> pages = [
    // const ImageHomePage(),
    // const VideoHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(builder: (context, nav, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Share Shpere'),
        ),
        // body: pages[nav.currentIndex],
        body: Container(),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              nav.changeIndex(value);
            },
            currentIndex: nav.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.image, color: Color.fromARGB(255, 71, 96, 236)),
                label: 'Images & Videos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library_sharp,
                    color: Color.fromARGB(255, 71, 96, 236)),
                label: 'Help & chat',
              ),
            ]),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 211, 208, 221),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/logo.png",
                        height: 80,
                        width: 80,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Text(
                        "Welcome to Share Sphere",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  ListTile(
                    title: const Text("Home"),
                    leading: const Icon(Icons.home),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainActivity()));
                    },
                  ),
                  ListTile(
                    title: Text("Images"),
                    leading: Icon(Icons.image),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Container()));
                    },
                  ),
                  ListTile(
                    title: Text("Videos"),
                    leading: Icon(Icons.video_call),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Container()));
                    },
                  ),
                  ListTile(
                    title: const Text("Share App"),
                    leading: const Icon(Icons.share),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainActivity()));
                    },
                  ),
                  ListTile(
                    title: const Text("Rate us"),
                    leading: const Icon(Icons.rate_review),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainActivity()));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
