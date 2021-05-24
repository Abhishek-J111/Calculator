import 'package:flutter/material.dart';
// import 'Widgets/buttons.dart';
import 'Screen/calculatorscreen.dart';
void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primaryColor: Colors.grey[300]
      ),
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),     
    );
  }
}