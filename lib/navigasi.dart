import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/home.dart';
import 'package:pet_care/notifikasi.dart';
import 'package:pet_care/pesan.dart';
import 'package:pet_care/profile.dart';

class Navigasi extends StatefulWidget {
  @override
  _NavigasiState createState() => _NavigasiState();
}

class _NavigasiState extends State<Navigasi> {
  int _page = 0;
  final _pageOption = [
    HomePage(),
    Notifikasi(),
    Pesan(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOption[_page],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey[200],
          buttonBackgroundColor: Colors.white,
          height: 70,
          items: <Widget>[
            Icon(Icons.home,size: 30,color: Colors.black,),
            Icon(Icons.notifications,size: 30,color: Colors.black,),
            Icon(Icons.message, size: 30, color: Colors.black,),
            Icon(Icons.person,size: 30,color: Colors.black,)
          ],
          animationDuration: Duration(
            milliseconds: 200,
          ),
          index: 0,
          animationCurve: Curves.bounceInOut,
          onTap:(index){
            setState(() {
              _page = index;
            });
            debugPrint("Index $index");
          },
        ),
    );
  }
}
