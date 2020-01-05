import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donasi'),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Center(
          child: Text("Donasi"),
        ),
      ),
    );
  }
}
