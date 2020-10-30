import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

randomOne() {
  var rng = new Random();
  final int firstRandomNumber = rng.nextInt(100);
  return firstRandomNumber;
}

randomTwo() {
  var rng = new Random();
  final int secondRandomNumber = rng.nextInt(100);
  return secondRandomNumber;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculate Randomly',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'Calculate Randomly'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int first = randomOne();
  int second = randomTwo();
  String resultOnScreen;
  bool check=true;
  String checkScreen=" ";
  result() {
    int result = first + second;
    return result;
  }

  void twoRandom() {
    setState(() {
      first = randomOne();
      second = randomTwo();
    });
  }
  void checkChangeTrue() {
    setState(() {
      check=true;
      checkScreen="True";
    });
  }

  void checkChangeFalse() {
    setState(() {
      check=false;
      checkScreen="False";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                first.toString(),
                style: TextStyle(color: Colors.black, fontSize: 27),
              ),
              Text(
                "+",
                style: TextStyle(color: Colors.black, fontSize: 27),
              ),
              Text(
                second.toString(),
                style: TextStyle(color: Colors.black, fontSize: 27),
              ),
              FlatButton(
                color: Colors.deepOrange,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  int result = first + second;
                  print(result);
                  twoRandom();
                  print("new first" + first.toString());
                  print("new second" + second.toString());
                  int resultOnScreenInteger = int.parse(resultOnScreen);
                  if(result==resultOnScreenInteger){
                    checkChangeTrue();
                  }
                  else{
                    checkChangeFalse();
                  }
                },
                child: Text(
                  "Check",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:150,right:150),
            child: TextField(
                onChanged: (String onScreen){
                resultOnScreen=onScreen;
                },
              keyboardType: TextInputType.number,
              maxLength: 3,
              autofocus: true,
                style: TextStyle(
                    fontSize: 30.0,
                    height: 1.0,
                    color: Colors.black
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                checkScreen,
                style: TextStyle(color: Colors.black, fontSize: 27),
              ),
            ],
          ),

          Row(
            children: [
              //empty
            ],
          ),
        ],
      ),
    );
  }
}
