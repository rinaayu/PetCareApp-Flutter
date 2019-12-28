import 'package:flutter/material.dart';
import 'package:pet_care/splashscreen_view.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Pet Care',
      debugShowCheckedModeBanner: false,

      home : SplashScreenPage(),

    );
  }
}
