import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TabBar',
      home: Home(),
      theme: ThemeData(primaryColor: Colors.black),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = TabController(length: 2, vsync: this);

    var tabBarItem = TabBar(
      tabs:  [
        Tab(
          icon: Icon(Icons.list,),
          text:"List",
        ),
        Tab(
          icon: Icon(Icons.grid_on),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    );

    var listItem = ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: Card(
              elevation: 5.0,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text("ListItem $index"),
              ),
            ),
            onTap: () {
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
                      content: Text("Selected Item $index"),
                      actions: <Widget>[
                        CupertinoButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"))
                      ],
                    );
                  });
            });
      },
    );

    var gridView = GridView.builder(
        itemCount: 20,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Card(
              elevation: 5.0,
              child: Container(
                alignment: Alignment.center,
                child: Text('Item $index'),
              ),
            ),
            onTap: () {
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Column(
                        children: <Widget>[
                          Text("GridView"),
                          Icon(
                            Icons.favorite,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      content: Text("Selected Item $index"),
                      actions: <Widget>[
                        CupertinoButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text("OK"))
                      ],
                    );
                  });
            },
          );
        });

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter TabBar"),
          bottom: tabBarItem,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            listItem,
            gridView,
          ],
        ),
      ),
    );
  }
}
