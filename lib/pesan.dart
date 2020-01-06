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

        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xFF185058),
                    Color(0xFF008772)
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight
              )
          ),
        ),
        title: Text('Pesan', style: TextStyle(color: Colors.white),),

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
