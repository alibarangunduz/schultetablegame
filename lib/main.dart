import 'package:flutter/material.dart';
import 'package:schultetablegame/StartGame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Schulte Table Game',
        theme: ThemeData(
          primarySwatch: Colors.blue, 
        ),
        home: StartGame());
  }
}
