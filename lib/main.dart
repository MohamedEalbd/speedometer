import 'package:flutter/material.dart';
import 'package:speedometer/home/myhome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SpeedMeter()
    );
  }
}

