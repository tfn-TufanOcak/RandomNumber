
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}
randomOne(){
  var rng = new Random();
  final int firstRandomNumber = rng.nextInt(100);
  return firstRandomNumber;
}
randomTwo(){
  var rng = new Random();
  final int secondRandomNumber = rng.nextInt(100);
  return secondRandomNumber;
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Calculate',
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
      home: MyHomePage(title: 'Random Calculate'),
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
  String first=randomOne().toString();
  String second=randomTwo().toString();
  void twoRandom(){
    setState(() {
      first=randomOne().toString();
      second=randomTwo().toString();
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            first,
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
          Text(
            "+",
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
          Text(
            second,
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
          FlatButton(color: Colors.deepOrange,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.black,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
                        onPressed: () {
                          int intFirst = int.parse(first);
                          int intSecond = int.parse(second);
                          int result = intFirst+intSecond;
                          print(result);
                          twoRandom();
                          print("new first"+first);
                          print("new second"+second);
                        },
            child: Text(
              "Flat Button",
              style: TextStyle(fontSize: 20.0),
            ),),
          Text(
            "                                                   ",
            style: TextStyle(color: Colors.black, fontSize: 27),
          ),
        ],
      ),

    );
  }
}
