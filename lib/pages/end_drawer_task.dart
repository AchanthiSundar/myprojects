import 'package:myprojects/model/user.dart';
import 'package:flutter/material.dart';

class EndDrawerTask extends StatelessWidget {
  const EndDrawerTask({super.key});

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "End Drawer",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
      ),
      endDrawer: Drawer(
        elevation: 10,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(urlImage),
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(urlImage),
                )
              ],
            ),
            ExpansionTile(

              leading: const Icon(Icons.account_circle),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(name),
              children: [
                ListTile(
                  // contentPadding: const EdgeInsets.only(left: 50),
                  leading: const Icon(Icons.add),
                  title: Text(name),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
