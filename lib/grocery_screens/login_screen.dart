import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myprojects/grocery_screens/dashboard/grocery_app_screens.dart';
import 'package:myprojects/grocery_screens/splash_screen.dart';
import 'package:myprojects/utils/custom_function.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/list_vew.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDashboard(),
    );
  }
}

enum FormData {
  Email,
  password,
}

class LoginDashboard extends StatefulWidget {
  const LoginDashboard({super.key});

  @override
  State<LoginDashboard> createState() => _LoginDashboardState();
}

class _LoginDashboardState extends State<LoginDashboard> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color disable = Colors.grey;
  Color backgroundColor = const Color(0xFF1F1A30);
  bool ispasswordev = true;
  FormData? selected;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification:
          (OverscrollIndicatorNotification overscrollIndicatorNotification) {
        overscrollIndicatorNotification.disallowIndicator();
        return true;
      },
      child: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              HexColor("#6F006D").withOpacity(0.8),
              HexColor("#6F006D"),
              HexColor("#44006E"),
              HexColor("#44006E")
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                color:
                    const Color.fromARGB(255, 171, 211, 250).withOpacity(0.4),
                child: Container(
                  width: 400,
                  padding: const EdgeInsets.all(40.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Please sign in to continue",
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 0.5),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: selected == FormData.Email
                              ? enabled
                              : backgroundColor,
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          onTap: () {
                            setState(() {
                              selected = FormData.Email;
                            });
                          },
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: selected == FormData.Email
                                  ? enabledtxt
                                  : disable,
                              size: 20,
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                                color: selected == FormData.Email
                                    ? enabledtxt
                                    : disable,
                                fontSize: 12),
                          ),
                          style: TextStyle(
                              color: selected == FormData.Email
                                  ? enabledtxt
                                  : disable,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: selected == FormData.password
                                ? enabled
                                : backgroundColor),
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          controller: passwordController,
                          onTap: () {
                            setState(() {
                              selected = FormData.password;
                            });
                          },
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.lock_open_outlined,
                                color: selected == FormData.password
                                    ? enabledtxt
                                    : disable,
                                size: 20,
                              ),
                              suffixIcon: IconButton(
                                icon: ispasswordev
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : disable,
                                        size: 20,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: selected == FormData.password
                                            ? enabledtxt
                                            : disable,
                                        size: 20,
                                      ),
                                onPressed: () => setState(
                                    () => ispasswordev = !ispasswordev),
                              ),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                  color: selected == FormData.password
                                      ? enabledtxt
                                      : disable,
                                  fontSize: 12)),
                          obscureText: ispasswordev,
                          // obscureText is used to hide the password
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                              color: selected == FormData.password
                                  ? enabledtxt
                                  : disable,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CupertinoButtonExample(
                        onPressed: () async {
                          if (emailController.text.isEmail) {
                            if (passwordController.text.isNotEmpty) {
                              hideKeyboard();
                              groceryPage();
                            } else {
                              showCupertinoAlertDialog(
                                  context, "Enter Password!");
                            }
                          } else {
                            showCupertinoAlertDialog(
                                context, "Enter The Valid Email!");
                          }
                        },
                        text: "Login",
                        gradient: const LinearGradient(
                          colors: [Colors.red, Colors.purple],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text("Version 1.0",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              fontSize: 14))
                    ],
                  ),
                ),
              ),

              //End of Center Card
              //Start of outer card
            ],
          ),
        ),
      )),
    ));
  }

  void groceryPage() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool(SplashScreenState.KEY_LOGIN, true);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const GroceryApp()));
    // Navigator.pop(context);
    // await Navigator.of(context).push(
    //   PageTransition(
    //       type: PageTransitionType.rightToLeft,
    //       child: const GroceryApp()),
    // );
  }
}
