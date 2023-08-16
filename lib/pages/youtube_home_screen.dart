import 'dart:ui';

import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:myprojects/utils/custom_function.dart';
import 'package:myprojects/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../model/data.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: const HomeScreen(),
//   ));
// }

class YoutubeHomePage extends StatelessWidget {
  const YoutubeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _bottomIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _bottomIndex = index;
    });
  }

  @override
  void initState() {
    _tabController =
        TabController(length: topics.length, vsync: this, initialIndex: 0);
    super.initState();
  }

  List<String> topics = [
    'All',
    'Flutter',
    'Computer programming',
    'Live',
    'Music',
    'Mixes',
    'Tamil Cinema',
  ];

  List<Video> videos = Video.videos;

  _generateVideos() {
    List<Widget> videosWidgets = [];
    for (int i = 0; i < videos.length; i++) {
      videosWidgets.add(Column(
        children: <Widget>[
          Container(
            height: 200,
            alignment: Alignment.bottomRight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(videos[i].thumbnailUrl),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.black54),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                  child: Text(videos[i].duration!,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(videos[i].channelArt!),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  //so this expanded used A RenderFlex overflowed by 28 pixels on the right.
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              videos[i].title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              // style: const TextStyle(
                              //     fontSize: 16, fontWeight: FontWeight.w600),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: 16.0),
                            )),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Flexible(
                        child: Text(
                          '${videos[i].channelName!}\t\t${videos[i].viewCount!}\t\t${videos[i].upload!}',
                          // style:
                          //     const TextStyle(fontSize: 14, color: Colors.black54),

                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.more_vert)
              ],
            ),
          )
        ],
      ));
    }
    return videosWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      //  drawer: const NavigationDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //used to fixed the navigation bar not floating
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_fill_outlined),
              activeIcon: Icon(Icons.play_circle),
              label: 'Shorts'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline_sharp),
              activeIcon: Icon(Icons.add_circle),
              label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              activeIcon: Icon(Icons.subscriptions),
              label: 'Subscriptions'),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            activeIcon: Icon(Icons.video_library),
            label: 'Library',
          ),
        ],
        onTap: _onItemTapped,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        elevation: 10,
        currentIndex: _bottomIndex,
        selectedItemColor: Colors.black87,
        // unselectedItemColor: const Color(0xff606060),
      ),
      body: ColorfulSafeArea(
        color: Colors.white,
        overflowRules: const OverflowRules.all(true),
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              elevation: 5,
              backgroundColor: Colors.white,
              title: Image.asset(
                'images/logo_dark.png',
                height: 22,
              ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          Icons.cast_sharp,
                          color: Colors.black,
                          // size: 25,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.notification_add_outlined,
                          color: Colors.black,
                          // size: 28,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.search_outlined,
                          color: Colors.black,
                          // size: 28,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const CircleAvatar(
                          radius: 13,
                          backgroundColor: Colors.blue,
                          child: Text(
                            'a',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                isScrollable: true,
                onTap: (index) {
                  setState(() {
                    if (_tabController.index == 0) {
                      Navigator.of(context).push(
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: const NavigationDrawerWidget()),
                      );
                    }
                    _tabController.index = index;
                  });
                },
                tabs: List.generate(
                    topics.length,
                    (index) => Tab(
                          child: Container(
                            decoration: BoxDecoration(
                                color: index == _tabController.index
                                    ? Colors.black54
                                    : Colors.black12,
                                // borderRadius: BorderRadius.circular(12)),
                                gradient: const LinearGradient(
                                  colors: [Colors.red, Colors.purple],
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(9))),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                topics[index],
                                style: const TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        )),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                indicatorWeight: 1,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.black,
                labelColor: Colors.white,
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     _generateVideos(),
            //     childCount: videos.length,
            //   ),
            // ),
            SliverFixedExtentList(
              itemExtent: 300,
              delegate: SliverChildListDelegate(_generateVideos()),
            )
          ],
        ),
      ),
    );
    // );
  }
}
