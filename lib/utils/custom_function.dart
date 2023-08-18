import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myprojects/grocery_screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../grocery_screens/login_screen.dart';

void showCupertinoAlertDialog(BuildContext context, String content) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Text(
          content,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontSize: 20.0),
        ),
        actions: [
          CupertinoDialogAction(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}

void showAlertDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(children: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              size: 25,
              color: Colors.indigo,
            ),
            onPressed: () {},
          ),
          const Text(
            '  Alert Dialog.',
            style: TextStyle(color: Colors.indigo),
          )
        ]),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "YES",
              style: TextStyle(color: Colors.indigo),
            ),
            onPressed: () {
              //Put your code here which you want to execute on Yes button click.
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text(
              "CANCEL",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              //Put your code here which you want to execute on Cancel button click.
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class GradientButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final LinearGradient gradient;

  GradientButton({
    required this.onPressed,
    required this.text,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return TouchRippleEffect(
      rippleColor: Colors.grey,
      borderRadius: BorderRadius.circular(25),
      child: GestureDetector(
        onTap: onPressed as void Function()?,
        child: Container(
          width: 90,
          constraints: const BoxConstraints(minWidth: 85.0, minHeight: 33.0),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoButtonExample extends StatelessWidget {
  final Function onPressed;
  final String text;
  final LinearGradient gradient;

  const CupertinoButtonExample({
    super.key,
    required this.onPressed,
    required this.text,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(25),
        ),
        child: CupertinoButton(
          padding: EdgeInsets.all(10),
          onPressed: onPressed as void Function()?,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              letterSpacing: 0.5,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}

void showCupertinoAlertLogoutDialog(BuildContext context, String content) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        content: Text(
          content,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontSize: 20.0),
        ),
        actions: [
          CupertinoDialogAction(
              child: const Text("Ok"),
              onPressed: () async {

                //Navigator.popUntil(context, ModalRoute.withName('/'));

                var sharedPrefs = await SharedPreferences.getInstance();
                sharedPrefs.remove(SplashScreenState.KEY_LOGIN);
                Navigator.pop(context, true);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                // Navigator.of(context).push(PageTransition(
                //   type: PageTransitionType.leftToRight,
                //   child: const LoginScreen(),
                // ));
              }),
          CupertinoDialogAction(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}
