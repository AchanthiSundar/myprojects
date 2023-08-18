import 'dart:convert' as convert;

import 'package:myprojects/utils/custom_function.dart';
import 'package:myprojects/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const ApiTest());
}

class ApiTest extends StatelessWidget {
  const ApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
          centerTitle: true,
          title: (const Text(
            "Api Test",
            style: TextStyle(
                fontFamily: "BungeeSpice", fontStyle: FontStyle.italic),
          ))),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 50,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(colors: [Colors.red, Colors.purple]),
              borderRadius: BorderRadius.circular(20)),
          child: TextButton(
              onPressed: () {
                setState(() {
                  testApi();
                });
              },
              child: const Text(
                "Tap Me",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
      ),
    );
  }

  Future<void> testApi() async {
    var url =
        Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Request with json response:$jsonResponse');
      showCupertinoAlertDialog(context, 'Number of books about http: $itemCount.');
    } else {
      showCupertinoAlertDialog(context, 'Request failed with status: ${response.statusCode}.');
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
