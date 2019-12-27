import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('Home'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Text('Halo'),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey[200],
        buttonBackgroundColor: Colors.white,
        height: 70,
        items: <Widget>[
          Icon(Icons.home,size: 30,color: Colors.black,),
          Icon(Icons.notifications,size: 30,color: Colors.black,),
          Icon(Icons.person,size: 30,color: Colors.black,)
        ],
        animationDuration: Duration(
          milliseconds: 200,
        ),
        index: 0,
        animationCurve: Curves.bounceInOut,
        onTap: (index){
          debugPrint("Index $index");
        },
      ),
    );
  }
}
