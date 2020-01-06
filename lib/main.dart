import 'package:flutter/material.dart';
import 'package:pet_care/splashscreen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'navigasi.dart';
//import 'package:pet_care/login.dart';

void main() => runApp(MyApp());
final FirebaseAuth auth = FirebaseAuth.instance;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: new StreamBuilder(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Navigasi();
          }
          return SplashScreenPage();
        },
      ),
    );
  }
}
