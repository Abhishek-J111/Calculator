import 'package:flutter/material.dart';
import 'package:calculator/Widgets/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  List values = [
    "AC",
    "DEL",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    "00",
    ".",
    "=",
  ];
  String userinput = '';
  String answer = '0';

// Method For Gesture Detector
  void gestureDetect(int index) {
    if (index == 0) {
      setState(() {
        userinput = '';
        answer = '0';
      });
    } else if (index == 1) {
      setState(() {
        if (userinput.length == 1) {
          userinput = '';
          answer = '0';
        } else {
          userinput = userinput.substring(0, userinput.length - 1);
          equal();
        }
      });
    } else if (index == 19) {
      equal();
    } else {
      setState(() {
        userinput = userinput + values[index];
      });
    }
  }

//  Method to Calculate
  void equal() {
    try {
      String finalParsed = userinput;
      print(finalParsed);
      finalParsed = finalParsed.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(finalParsed);
      print(exp);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      print(eval);
      setState(() {
        answer = eval.toString();
      });
    } catch (Error) {
      setState(() {
        answer = "Error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        color: Color(0xfffaf0e6),
                        child: Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Container(
                              height: 120.0,
                              child: Text(
                                userinput,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 30.0),
                              ),
                              alignment: Alignment.topLeft,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            child: Text(
                              answer,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      Divider(color: Colors.black)
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    child: GridView.builder(
                      itemCount: values.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0,
                          childAspectRatio: 1.1),
                      itemBuilder: (BuildContext context, int index) =>
                          SizedBox(
                              child: GestureDetector(
                        onTap: () {
                          gestureDetect(index);
                        },
                        child: Button(
                          values[index],
                        ),
                      )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
