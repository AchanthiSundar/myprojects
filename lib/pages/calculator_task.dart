import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:myprojects/widgets/navigation_drawer_widget.dart';

class CalcTask extends StatelessWidget {
  const CalcTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const _Dashboard(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class _Dashboard extends StatefulWidget {
  const _Dashboard({super.key});

  @override
  State<_Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<_Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      backgroundColor: Colors.white,
      appBar: AppBar(centerTitle: true, title: const Text("Calculator")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        hideInput ? '' : input,
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.black,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          output,
                          style: TextStyle(
                            fontSize: outputSize,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ))),
          Row(
            children: [
              customButton(btnText: "AC"),
              customButton(btnText: "<-"),
              customButton(btnText: " "),
              customButton(btnText: "/"),
            ],
          ),
          Row(
            children: [
              customButton(btnText: "7"),
              customButton(btnText: "8"),
              customButton(btnText: "9"),
              customButton(btnText: "*"),
            ],
          ),
          Row(
            children: [
              customButton(btnText: "4"),
              customButton(btnText: "5"),
              customButton(btnText: "6"),
              customButton(btnText: "-"),
            ],
          ),
          Row(
            children: [
              customButton(btnText: "1"),
              customButton(btnText: "2"),
              customButton(btnText: "3"),
              customButton(btnText: "+"),
            ],
          ),
          Row(
            children: [
              customButton(btnText: "%"),
              customButton(btnText: "0"),
              customButton(btnText: "."),
              customButton(btnText: "="),
            ],
          ),
        ],
      ),
    );
  }

  // String input = "", output = "", operator = "";
  // int firstNo = 0, secondNo = 0;

  // void onClicked(String clickedBtnText) {
  //   if (clickedBtnText == "AC") {
  //     input = " ";
  //     output = " ";
  //     firstNo = 0;
  //     secondNo = 0;
  //   } else if (clickedBtnText == "<-") {
  //     if (input.isNotEmpty) {
  //       input = input.substring(0, input.length - 1);
  //     }
  //   } else if (clickedBtnText == "+" ||
  //       clickedBtnText == "-" ||
  //       clickedBtnText == "*" ||
  //       clickedBtnText == "/" || clickedBtnText == "%") {
  //     if (input.isNotEmpty) {
  //       firstNo = int.parse(output);
  //       input = " ";
  //       operator = clickedBtnText;
  //     }
  //   } else if (clickedBtnText == "=") {
  //     secondNo = int.parse(output);
  //     if (operator == "+") {
  //       input = (firstNo + secondNo).toString();
  //     }
  //     if (operator == "-") {
  //       input = (firstNo - secondNo).toString();
  //     }
  //     if (operator == "*") {
  //       input = (firstNo * secondNo).toString();
  //     }
  //     if (operator == "/") {
  //       input = (firstNo ~/ secondNo).toString();
  //     }
  //     if (operator == "%") {
  //       input = (firstNo % secondNo).toString();
  //     }
  //   } else {
  //     input = int.parse(output + clickedBtnText).toString();
  //   }
  //   setState(() {
  //     output = input;
  //   });
  // }

  Widget customButton({btnText}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.all(22)),
            onPressed: () => onButtonClick(btnText)
            // => return expression symbol
            ,
            child: Text(
              btnText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }

  double firstnumber = 0.0;
  double secondnumber = 0.0;
  var input = '';
  var output = '';
  var operation = '';
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
    //if value is AC
    if (value == 'AC') {
      input = '';
      output = '';
    } else if (value == '<-') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        // userInput = input.replaceAll('X', '*');
        Parser p = Parser();
        Expression expression =
            p.parse(userInput); //Expression is used to calculating process
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith(".0")) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52.0;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34.0;
    }

    setState(() {});
  }
}
