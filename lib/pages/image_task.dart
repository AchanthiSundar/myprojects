
import 'package:flutter/material.dart';

import '/widgets/navigation_drawer_widget.dart';

class ImageTask extends StatelessWidget {
  const ImageTask({super.key});

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
  bool isVisibility = true;
  bool isVisibility2 = false;
  bool isVisibility3 = false;
  bool isVisibility4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image Task"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.purple],
              /*begin: Alignment.topLeft, // for align the gradient color
              end: Alignment.bottomRight*/
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              customImageBackground(isVisibility),
              customImageBackground(isVisibility2),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              customImageBackground(isVisibility3),
              customImageBackground(isVisibility4),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                width: 150,
                height: 50,
                margin: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Colors.red, Colors.purple]),
                    borderRadius: BorderRadius.circular(20)),
                // child: ButtonWidget(
                //   icon: Icons.ac_unit_rounded,
                //   text: 'Click Me',
                //   onClicked: () => setState(() => {
                //         if (isVisibility)
                //           {
                //             isVisibility = !isVisibility,
                //             isVisibility2 = !isVisibility2
                //           }
                //         else if (isVisibility2)
                //           {
                //             isVisibility2 = !isVisibility2,
                //             isVisibility3 = !isVisibility3
                //           }
                //         else if (isVisibility3)
                //           {
                //             isVisibility3 = !isVisibility3,
                //             isVisibility4 = !isVisibility4
                //           }
                //         else if (isVisibility4)
                //           {
                //             isVisibility4 = !isVisibility4,
                //             isVisibility = !isVisibility
                //           }
                //       }),
                // ),
                child: TextButton(
                  onPressed: () => setState(() => {
                        if (isVisibility)
                          {
                            isVisibility = !isVisibility,
                            isVisibility2 = !isVisibility2
                          }
                        else if (isVisibility2)
                          {
                            isVisibility2 = !isVisibility2,
                            isVisibility3 = !isVisibility3
                          }
                        else if (isVisibility3)
                          {
                            isVisibility3 = !isVisibility3,
                            isVisibility4 = !isVisibility4
                          }
                        else if (isVisibility4)
                          {
                            isVisibility4 = !isVisibility4,
                            isVisibility = !isVisibility
                          }
                      }),
                  child: const Text(
                    "Click Me",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

Widget customImageBackground(bool isVisible) {
  return Column(children: [
    Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [Colors.red, Colors.purple]),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(8),
      child: Column(children: [
        if (isVisible)
          Visibility(
              visible: isVisible,
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("images/dart_flutter_banner.jpeg"),
              ))
      ]),
    ),
  ]);
}
