import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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

class LoginDashboard extends StatefulWidget {
  const LoginDashboard({super.key});

  @override
  State<LoginDashboard> createState() => _LoginDashboardState();
}

class _LoginDashboardState extends State<LoginDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                )
            )
        )
    );
  }
}
