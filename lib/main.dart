// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomePage(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter myApps',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a blue toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter myApps Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   var title = 'hii';
//   var edit = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(30),
//             bottomRight: Radius.circular(30),
//           )),
//           foregroundColor: Colors.black,
//           // change the color of icon
//           title: const Text('hello'),
//           leading: IconButton(
//             onPressed: () {
//               setState(() {
//                 title = 'Hamburger Icon';
//               });
//             },
//             icon: const Icon(Icons.menu),
//           ),
//           leadingWidth: 20,
//           //leading width is used to margin left
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     title = 'Add';
//                   });
//                 },
//                 icon: const Icon(Icons.add)),
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   title = 'Alarm';
//                 });
//               },
//               icon: const Icon(Icons.add_alarm),
//             )
//           ],
//           toolbarHeight: 80,
//           // set app bar height kToolbarHeight is inbuild Value
//           elevation: 18,
//           // shadowColor:Colors.limeAccent , //shadow color under app bar
//           // shape: const Border(
//           //   bottom: BorderSide(
//           //     color: Colors.deepOrange,
//           //     width: 5,
//           //   )
//           // ),
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Colors.red, Colors.purple],
//                 /*begin: Alignment.topLeft, // for align the gradient color
//               end: Alignment.bottomRight*/
//               ),
//             ),
//           ),
//         ),
//         body: Center());
//   }
// }



// class _CalcDesign extends StatelessWidget {
//   const _CalcDesign({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blueGrey,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       // theme: ThemeData(
//       //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       //   useMaterial3: true,
//       // ),
//
//       debugShowCheckedModeBanner: false,
//       home: const Dashboard(),
//     );
//   }
// }
//
// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});
//
//   @override
//   State<Dashboard> createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:myprojects/pages/list_vew.dart';
import 'package:myprojects/pages/youtube_home_screen.dart';
import 'package:myprojects/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:myprojects/model/navigation_item.dart';
import 'package:myprojects/pages/calculator_task.dart';
import 'package:myprojects/pages/edit_textcontroller_task.dart';
import 'package:myprojects/pages/image_task.dart';
import 'pages/end_drawer_task.dart';
import 'pages/grid_list_view.dart';
import 'routes/app_pages.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    // GetMaterialApp(
    //   initialRoute: AppPages.INITIAL,
    //   getPages: AppPages.routes,
    //   debugShowCheckedModeBanner: false,
    // ),
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  static final String title = 'Navigation Drawer';

  const MyApp({super.key});

  @override //return function symbol =>
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: const MainPage(),
        ),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<NavigationProvider>(context);
    final navigationItem = provider.navigationItem;

    switch (navigationItem) {
      case NavigationItem.calculatorTask:
        return const CalcTask();
      case NavigationItem.imageTask:
        return const ImageTask();
      case NavigationItem.editTask:
        return const EditTextTask();
      case NavigationItem.listViewTask:
        return const ContactListTask();
      case NavigationItem.gridListViewTask:
        return const GridListView();
      case NavigationItem.youTubeTask:
        return const YoutubeHomePage();
    }
  }
}
