import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var score=0;
  var n=0;
  List que_list=[
    Questions("1. Ronaldo is better than Messi.",true),
    Questions("2. IIT Bombay is the best college in the country.",true),
    Questions("3. Are you enjoying Learner's Space Intro to App Dev.",true),
    Questions("4. Pizza > Burger ",false),
    Questions("5. Are you a human ?", false),
  ];

  void checkAnswer(bool choice,BuildContext ctx){
    if(choice==que_list[n].ans)
    {
      //debugPrint("Correct");
      score=score+1;

    }
    else
    {

    }
    setState(() {
      if(n<que_list.length-1)
      {
        n=n+1;
      }
      else{
        final snackbar=SnackBar(content: Text("Quiz Completed Score $score/5"),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.white60,
        );
        Scaffold.of(ctx).showSnackBar(snackbar);
        reset();
      }
    });
  }

  void reset(){
    setState(() {
      n=0;
      score=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(backgroundColor: Colors.blueGrey,title: Text("Quiz"),centerTitle:true,),
      body: Builder(
        builder:(ctx)=>Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text("Your Score : $score/5 ",style: TextStyle(
                    color: Colors.grey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                  InkWell(
                    onTap:()=>reset(),
                    child: Text("Reset ",style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(),
                  border: Border.all(color: Colors.blue),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(que_list[n].que,style: TextStyle(fontSize: 15.0,
                    color : Colors.white60 ,),)
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:370.0),
                    child: RaisedButton(
                      child: Text("True",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                      onPressed: ()=>checkAnswer(true,ctx),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:370.0),
                    child: RaisedButton(
                      child: Text("False",style: TextStyle(color: Colors.white,fontSize: 20.0),),
                      padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                      onPressed: ()=>checkAnswer(false,ctx),
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}