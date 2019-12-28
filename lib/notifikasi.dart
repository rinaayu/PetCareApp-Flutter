import 'package:flutter/material.dart';

class Notifikasi extends StatefulWidget {
  @override
  _NotifikasiState createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Notifikasi"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Text("Tidak Ada Notifikasi"),
        ),
      ),
    );
  }
}
