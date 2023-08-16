import 'dart:async';

import 'package:myprojects/grocery_screens/dashboard/grocery_app_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

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
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay = Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.pop(context);
    Navigator.of(context).push(
      PageTransition(
          type: PageTransitionType.rightToLeft,
          child: const LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: HexColor("#6F006D"),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: HexColor("#44006E"),
      body: Center(
        child: Image.asset("images/splash_screen.jpeg",
        fit: BoxFit.cover,),
      ),
    );
  }
}
