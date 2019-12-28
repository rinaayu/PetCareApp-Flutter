import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Profile"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Text("Ini Profile"),
        ),
      ),
    );
  }
}
