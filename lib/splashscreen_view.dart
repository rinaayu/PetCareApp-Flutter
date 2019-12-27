import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pet_care/login.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => new _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState(){
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 10);
    return Timer(duration, (){
      Navigator.of(context) .pushReplacement(
        MaterialPageRoute(builder:  (_){
          return LoginPage();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.contain
          )
        ),
        child: Center(
          child: Image.asset('assets/LOGO.PNG',
            width: 500.0,
            height: 200.0,

          ),
        ),
      ),
    );


  }
}