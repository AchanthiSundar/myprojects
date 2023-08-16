import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'navigator_item.dart';


class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GroceryAppDashboard(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple)
    );
  }
}

class GroceryAppDashboard extends StatefulWidget {
  const GroceryAppDashboard({super.key});

  @override
  State<GroceryAppDashboard> createState() => _GroceryAppDashboardState();
}

class _GroceryAppDashboardState extends State<GroceryAppDashboard> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigatorItems[currentIndex].screen,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 37,
                offset: const Offset(0, -12)),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepPurple,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            unselectedItemColor: Colors.black,
            items: navigatorItems.map((e) {
              return getNavigationBarItem(
                  label: e.label, index: e.index, iconPath: e.iconPath);
            }).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getNavigationBarItem(
      {required String label, required String iconPath, required int index}) {
    Color iconColor =
    index == currentIndex ? Colors.deepPurple : Colors.black;
    return BottomNavigationBarItem(
      label: label,
      icon: SvgPicture.asset(
        iconPath,
        color: iconColor,
      ),
    );
  }
}

