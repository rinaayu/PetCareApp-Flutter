import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailPage extends StatefulWidget{
  final DocumentSnapshot ds;
  DetailPage({this.ds});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String productImage;
  String id;
  String name;
  String jenis;
  String desc;

  TextEditingController nameInputController;
  TextEditingController descInputController;
  TextEditingController jenisInputController;

  Future getPost() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("posts").getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    super.initState();
    descInputController =
    new TextEditingController(text: widget.ds.data["desc"]);
    jenisInputController =
    new TextEditingController(text: widget.ds.data["jenis"]);
    nameInputController =
    new TextEditingController(text: widget.ds.data["name"]);
    productImage = widget.ds.data["image"];
    print(productImage);
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
                      child: productImage == ''
                          ? Text('Edit')
                          : Image.network(productImage + '?alt=media'),
                    ),
                  ],
                ),
                new IniciarIcon(),
                new ListTile(
                  leading: const Icon(Icons.perm_identity, color: Colors.black),
                  title: new TextFormField(
                    controller: nameInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Nama Hewan", labelText: "Nama Hewan"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                new ListTile(
                  leading: const Icon(Icons.pets, color: Colors.black),
                  title: new TextFormField(
                    controller: jenisInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Jenis Hewan", labelText: "Jenis Hewan"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                new ListTile(
                  leading: const Icon(Icons.list, color: Colors.black),
                  title: new TextFormField(
                    maxLines: 10,
                    controller: descInputController,
                    validator: (value) {
                      if (value.isEmpty) return "Ingresa un nombre";
                    },
                    decoration: new InputDecoration(
                        hintText: "Deskripsi", labelText: "Deskripsi"),
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




