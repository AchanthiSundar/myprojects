import 'package:myprojects/model/menu_list.dart';
import 'package:myprojects/widgets/navigation_drawer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../model/os_data_model.dart';

class GridListView extends StatelessWidget {
  const GridListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _Dashboard extends StatefulWidget {
  const _Dashboard({super.key});

  @override
  State<_Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<_Dashboard> {
  static List<String> osNameList = [
    'Cupcake Android 1.5',
    'Donut Android 1.6',
    'Eclair Android 2.0',
    'Froyo Android 2.2',
    'Gingerbread Android 2.3',
    'Honeycomb Android 3.0',
    'Ice Cream Sandwich Android 4.0',
    'Jelly Bean Android 4.3',
    'Kitkat Android 4.4',
    'Lollipop Android 5.0',
    'Marshmallow 6.0',
    'Nougat 7.0',
    'Oreo 8.0',
    'Pie 9.0',
    'Android 10',
    'Android 11',
    'Android 12',
    'Android 13',
  ];
  static List osImagesUrl = [
    // 'https://androidayuda.com/wp-content/uploads/2022/10/3.png',
    'https://4.bp.blogspot.com/-_a1ZFMdV6_E/Uzc9tGI4jjI/AAAAAAAAASs/IGoAkyPDsc4/s400/cute.jpg',
    'https://static.wikia.nocookie.net/android/images/f/f4/Androiddonut.jpg/revision/latest?cb=20111216213427',
    'https://static.wikia.nocookie.net/android/images/7/77/Screen_Shot_2011-12-16_at_1.08.09_PM.png/revision/latest?cb=20111216210924',
    'https://static.wikia.nocookie.net/android/images/8/89/Froyo.png/revision/latest?cb=20111216210125',
    'https://static.wikia.nocookie.net/android/images/1/15/Android-gingerbread-1.jpg/revision/latest?cb=20111216205104',
    'https://static.wikia.nocookie.net/android/images/d/d2/Honeycomb-logo2-e1298681115525.png/revision/latest?cb=20111216204245',
    'https://static.wikia.nocookie.net/android/images/d/de/11x05101719.jpg/revision/latest?cb=20111216203802',
    'https://static.wikia.nocookie.net/android/images/3/32/4.1_jelly_bean.png/revision/latest?cb=20170303195006',
    'https://4.bp.blogspot.com/-NoYzgJkUzkI/UnH89i6ZSgI/AAAAAAAACsU/nIOF3laWFLk/s1600/kk-hero.png',
    'https://1.bp.blogspot.com/-U9MP8MVJfRc/VECiwuK8QmI/AAAAAAAAA1w/27T9dWOLdhg/s400/l_image.png',
    'https://1.bp.blogspot.com/-k3chiPh9F-Y/VdFmE9k4hpI/AAAAAAAAB9A/H2_MqasmAgw/s1600/image00.png',
    'https://3.bp.blogspot.com/-MWOPd0fZUDU/V7pQm0LT78I/AAAAAAAADX4/zl4bJGHBQuAN2bPJD_xNTQ7GRCLW51VcACLcB/s800/android_nougat.png',
    'https://developer.android.com/static/images/about/versions/oreo/o-hero.png',
    'https://lh3.googleusercontent.com/irVp_NJs42CXUoiko8qBtaqiPaW5moNgCishazbQsAgbOi3hNChfE1S7z52JHWIrSOUXjcLDG0Bbq08T5E5o=w0',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPRhjjOMuKLIewA4RkP8yHlypUXMqBCX5V9GGkS2fEUJ9DLrYyTSJnHw-vVpVmK2iC0XU&usqp=CAU',
    'https://3.bp.blogspot.com/-j5uokxLDNBo/Xk1vUni8MUI/AAAAAAAAOKM/JaryFhvO9gIElT_E1f2k4ZlioR74Igg6ACLcBGAsYHQ/s1600/still.jpg',
    'https://1.bp.blogspot.com/--LuXJTDz_vI/YFIgU1spOkI/AAAAAAAAQRI/Cku9StJJwVoDiWXZkfg0i2H-aSYaogeDgCLcBGAsYHQ/s0/Android%2B12_logo.png',
    'https://developer.android.com/static/images/about/versions/13/android-13-hero.png',
  ];
  static List<OsDataModel> osData = List.generate(
      osNameList.length,
      (index) => OsDataModel(
          osNameList[index], '${osImagesUrl[index]}', osNameList[index]));

  List<MenuItem> menuList = [
    MenuItem(Icons.verified_user, 'My Profile'),
    MenuItem(Icons.autorenew, 'Book a Cab'),
    MenuItem(Icons.ac_unit, 'Booking Schedule'),
    MenuItem(Icons.center_focus_strong, 'Track Your Cab'),
    MenuItem(Icons.question_answer, 'Help & Feedback'),
    MenuItem(Icons.phone, 'Call to Transport'),
  ];

  @override
  Widget build(BuildContext context) {
    // tabController = TabController(length: 2, vsync: this)
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "List Grid View",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: 'BungeeSpice',
            fontSize: 24,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Material(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.red, Colors.purple],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: TabBar(
                      physics: const PageScrollPhysics(),
                      unselectedLabelColor: Colors.black54,
                      labelColor: Colors.black,
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      tabs: const [
                        Tab(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 28),
                            child: SizedBox(
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Text("List View",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Padding(
                            // padding: EdgeInsets.all(10.0),
                            padding: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 28),
                            child: SizedBox(
                              width: 100,
                              height: 30,
                              child: Center(
                                child: Text("Grid View",
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
            Expanded(
                child: TabBarView(
              children: [
                osListItem,
                osGridItem,
              ],
            ))
          ],
        ),
      ),
    );
  }

  var osListItem = ListView.builder(
      itemCount: osData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            elevation: 3.0,
            child: ListTile(
              title: Text(osData[index].name),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(osData[index].ImageUrl),
                  backgroundColor: Colors.transparent,
                ),
              ),
              onTap: () {
                {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Column(
                            children: <Widget>[
                              Text("ListView"),
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          content:
                              Text("Selected Item Is ${osData[index].name}"),
                          actions: <Widget>[
                            CupertinoButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await Navigator.of(context).push(
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: OsNameListDetail(
                                            osDataModel: osData[index])),
                                  );
                                },
                                child: Text("OK"))
                          ],
                        );
                      });
                }
              },
            ),
          ),
        );
      });

  var osGridItem = GridView.builder(
      itemCount: osData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: InkWell(
            child: Center(
              child: Column(children: [
                // Card(
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10)),
                //   child: Column(
                //     children: [
                //       SizedBox(
                //         height: 100,
                //         child: Image.network(
                //           osData[index].ImageUrl,
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       Text(
                //         osData[index].name,
                //         textAlign: TextAlign.center,
                //       )
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5,
                    child: Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 250,
                            height: 100,
                            child: Image.network(osData[index].ImageUrl),
                          ),
                        ),
                        Text(osData[index].name,textAlign: TextAlign.center,),
                        // subtitle: Text('This is a simple card in Flutter.'),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            onTap: () {
              {
                showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: const Column(
                          children: <Widget>[
                            Text("ListView"),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        content: Text("Selected Item Is ${osData[index].name}"),
                        actions: <Widget>[
                          CupertinoButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                await Navigator.of(context).push(
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: OsNameListDetail(
                                          osDataModel: osData[index])),
                                );
                              },
                              child: Text("OK"))
                        ],
                      );
                    });
              }
            },
          ),
        );
      });
}

class OsNameListDetail extends StatefulWidget {
  final OsDataModel osDataModel;

  const OsNameListDetail({super.key,required this.osDataModel});

  @override
  State<OsNameListDetail> createState() => _OsNameListDetailState();
}

class _OsNameListDetailState extends State<OsNameListDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.osDataModel.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 250,
            alignment: Alignment.center, //to align the center
            child: Image.network(
              widget.osDataModel.ImageUrl,
            ),
          ),
          Text(
            widget.osDataModel.desc,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}


