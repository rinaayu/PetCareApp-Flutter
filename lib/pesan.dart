import 'package:flutter/material.dart';

class Pesan extends StatefulWidget {
  @override
  _PesanState createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text("Pesan"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Text("Tidak Ada Pesan"),
        ),
      ),
    );
  }
}
