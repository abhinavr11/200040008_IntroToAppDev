import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android Dev',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "BACKSPACE") {
       _output = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand = "";
    }
    else if (buttonText == "+" || buttonText == "-" || buttonText == "/" ||
        buttonText == "*") {
      num1 = double.parse(output);

      operand = buttonText;
      _output = "0";
    }
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      }
      else {
        _output = _output + buttonText;
      }
    }
    else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }


    num1 = 0;
    num2 = 0;
    operand = "";
  }

  else{

  _output = _output + buttonText ;
  }


  print(_output);

  setState((){
  output = double.parse(_output).toStringAsFixed(2);
  });
}
Widget buildButton(String buttonText ){
return
  Expanded(
    child: OutlineButton(

      padding: EdgeInsets.all(24.0),
      child: new Text(buttonText,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold
      ),),
      onPressed: () =>
        buttonPressed(buttonText),

     
    ),
  );

}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: new Container(
         
        child: new Column(children: <Widget>  [

          Container(
            alignment : Alignment.centerRight,
              padding: new EdgeInsets.symmetric(vertical:12.0,
              horizontal:12.0),
              child: new Text(output, style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 48.0
          ),)),


           new Expanded(
             child:  new Divider(),
           ),



          new Column(
            children: [
              new Row( children : [

                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")


       ]),

              new Row( children : [

                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*")


              ]),

              new Row( children : [

                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")


              ]),

              new Row( children : [

                buildButton("."),
                buildButton("0"),
                buildButton("00"),
                buildButton("+")


              ]),

              new Row(children: [
                buildButton("BACKSPACE"),
                buildButton("="),
              ],)
            ],
          )
    ],
    )));
  }}