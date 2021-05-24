import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../Widgets/buttons.dart';

class Scientific extends StatefulWidget {
  @override
  _ScientificState createState() => _ScientificState();
}

class _ScientificState extends State<Scientific> {
  List values = [
    "AC",
    "DEL",
    "%",
    "/",
    "7",
    "6",
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
    "SCI",
    "0",
    ".",
    "=",
    
  ];
  String userinput = '';
  String answer = '0';

   gesture_detect(int index){
     if(index == 0){
       setState(() {
         userinput='';
         answer='0';
       });
     }
     else if(index ==1){
      setState(() {
        if(userinput.length ==1){
          userinput = '';
          answer ='0';
        }
        else{
         userinput = userinput.substring(0,userinput.length-1);
         equal();
        }
      });
     }
     else if(index == 19){
       equal();
     }
     else{
       setState(() {
         userinput = userinput +values[index];
       });
       
     }
   }

  equal(){
    String finalParsed = userinput;
       print(finalParsed);
       finalParsed =finalParsed.replaceAll('x', '*');
        Parser p = Parser();
        Expression exp = p.parse(finalParsed);
        print(exp);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        print(eval);
        setState(() {
          answer = eval.toString();
        });
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
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              userinput,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0),
                            ),
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ),
                      Divider(),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(answer),
                            alignment: Alignment.bottomRight,
                          ),
                        ),
                      ),
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
                          gesture_detect(index);
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