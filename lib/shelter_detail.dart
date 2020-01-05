import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailShelterPage extends StatefulWidget {
  final DocumentSnapshot ds;
  DetailShelterPage({this.ds});
  @override
  _DetailShelterPageState createState() => _DetailShelterPageState();
}

class _DetailShelterPageState extends State<DetailShelterPage> {
  String productImage;
  String nama;
  String rate;
  String phone;
  String alamat;
  String servis;
  String hari;
  String pukul;

  TextEditingController namaInputController;
  TextEditingController rateInputController;
  TextEditingController alamatInputController;
  TextEditingController phoneInputController;
  TextEditingController servisInputController;
  TextEditingController operasionalInputController;

  Future getPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("shelter").getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    namaInputController =
    new TextEditingController(text: widget.ds.data["nama"]);
    rateInputController =
    new TextEditingController(text: widget.ds.data["rate"]);
    alamatInputController =
    new TextEditingController(text: widget.ds.data["alamat"]);
    phoneInputController =
    new TextEditingController(text: widget.ds.data["phone"]);
    servisInputController =
    new TextEditingController(text: widget.ds.data["servis"]);
   operasionalInputController =
    new TextEditingController(text: widget.ds.data["hari"] + '\nPukul ' + widget.ds.data["pukul"] );

  }

  @override
  Widget build(BuildContext context) {
    getPost();
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      height: 300.0,
                      width: 300.0,
                      decoration: new BoxDecoration(
                          border: new Border.all(color: Colors.blueAccent)),
                      padding: new EdgeInsets.all(5.0),
                      child: productImage != null
                          ? Image.network(productImage + '?alt=media')
                          : Image.network('https://firebasestorage.googleapis.com/v0/b/pet-care-tubes-app.appspot.com/o/default.jpg?alt=media&token=9785f34a-6a70-4c5e-a68d-36cd91717a41')
                    ),
                  ],
                ),
                new IniciarIcon(),
                new ListTile(
                  leading: const Icon(Icons.star_border, color: Colors.black),
                  title: new TextFormField(
                    controller: rateInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Rating", labelText: "Rating"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                new ListTile(
                  leading: const Icon(Icons.room_service, color: Colors.black),
                  title: new TextFormField(
                    controller: servisInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Servis", labelText: "Servis"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                new ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.black),
                  title: new TextFormField(
                    maxLines: 2,
                    controller: operasionalInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Operasional", labelText: "Operasional"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                new ListTile(
                  leading: const Icon(Icons.location_on, color: Colors.black),
                  title: new TextFormField(
                    maxLines: 10,
                    controller: alamatInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Alamat", labelText: "Alamat"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconoMenu(
            icon: Icons.call,
            label: "Panggil",
          ),
          new IconoMenu(
            icon: Icons.message,
            label: "Pesan",
          ),
          new IconoMenu(
            icon: Icons.place,
            label: "Lokasi",
          ),
        ],
      ),

    );
  }
}

class IconoMenu extends StatelessWidget {
  IconoMenu({this.icon, this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            label,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}


