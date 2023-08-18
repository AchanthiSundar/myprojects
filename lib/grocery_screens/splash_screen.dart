import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myprojects/grocery_screens/dashboard/grocery_app_screens.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEY_LOGIN = "login";

  @override
  void initState() {
    super.initState();
    whereToGo();
    // const delay = Duration(seconds: 3);
    // Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.pop(context);
    Navigator.of(context).push(PageTransition(
      type: PageTransitionType.rightToLeft,
      child: const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: HexColor("#6F006D"),
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: HexColor("#44006E"),
      body: Center(
        child: Image.asset(
          "images/splash_screen.jpeg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEY_LOGIN);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const GroceryApp()));
          // Navigator.pop(context);
          // Navigator.of(context).push(PageTransition(
          //   type: PageTransitionType.rightToLeft,
          //   child: const GroceryApp(),
          // ));
        } else {
          loginPage();
        }
      } else {
        loginPage();
      }
    });
  }

  void loginPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    // Navigator.pop(context);
    // Navigator.of(context).push(PageTransition(
    //   type: PageTransitionType.rightToLeft,
    //   child: const LoginScreen(),
    // ));
  }
}
