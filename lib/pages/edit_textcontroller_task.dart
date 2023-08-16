import 'package:myprojects/widgets/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class EditTextTask extends StatelessWidget {
  const EditTextTask({super.key});

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
  var title = 'hii';
  var edit = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text("Edit Text"),),
      drawer: const NavigationDrawerWidget(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(title),
            TextButton(
              onPressed: () {
                setState(() {
                  title = edit.text;
                });
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: const Text(
                "Click Me",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            TextField(
              textAlign: TextAlign.start,
              controller: edit,
            ),
            TextField(
              onChanged: (String str) {
                setState(() {});
                title = str;
              },
            ),
            Card(
              elevation: 30,
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 9.0),
                        child: Image.asset(
                          'images/dart_flutter_banner.jpeg',
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Text('long information text',
                          textAlign: TextAlign.end),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
