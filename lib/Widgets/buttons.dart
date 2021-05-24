import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.height/8,
          height: MediaQuery.of(context).size.height/8,
          child: Center(child: Text('1')),
          decoration: BoxDecoration(
            color:Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset(4.0,4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-4.0,14.0),
                blurRadius: 15.0,
                spreadRadius: 1.0
              ),
            ]
          ),
        ),
      ),
    );
  }
}