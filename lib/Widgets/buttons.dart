import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Button(this.text);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.height / 10,
            height: MediaQuery.of(context).size.height / 10,
            child: Center(
                child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, 14.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ]),
          ),
        ),
      ),
    );
  }
}
