import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/shelter_detail.dart';

class CommonThings {
  static Size size;
}

class PetShelterPage extends StatefulWidget {
  @override
  _PetShelterPageState createState() => _PetShelterPageState();
}

class _PetShelterPageState extends State<PetShelterPage> {

  TextEditingController namaInputController;
  TextEditingController rateInputController;
  TextEditingController alamatInputController;
//  TextEditingController phoneInputController;
//  TextEditingController servisInputController;
//  TextEditingController operasionalInputController;
  String id;
  final db = Firestore.instance;
  String nama;
  String rate;
//  String phone;
  String alamat;
//  String servis;
//  String hari;
//  String pukul;

  navigateToDetail(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailShelterPage(
              ds: ds,
            )));
  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Shelter'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection("shelter").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("loading....");
          }
          int length = snapshot.data.documents.length;
          //print("from the streamBuilder: "+ snapshot.data.documents[]);
          // print(length.toString() + " doc length");
          return ListView.builder(
            itemCount: length,
            itemBuilder: (_, int index) {
              final DocumentSnapshot doc = snapshot.data.documents[index];
              return new Container(
                padding: new EdgeInsets.all(3.0),
                child: Card(
                  child: Row(
                    children: <Widget>[

//                      new Container(
//                        padding: new EdgeInsets.all(5.0),
//                        child: Image.network(
//                          '${doc.data["image"]}' + '?alt=media',
//                        ),
//                        width: 100,
//                        height: 100,
//                      ),
                      Expanded(
                        child: ListTile(
                          leading: Icon(Icons.pets),
                          title: Text(
                            doc.data["nama"],
                            style: TextStyle(
                              color: Colors.black45, fontSize: 21.0,
                            ),
                          ),
                          subtitle:
                          Row(
                              children: <Widget>[
                                Icon(Icons.star, color: Colors.yellow,),
                                Text(
                                  doc.data["rate"],
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 21.0),
                                ),
                              ]),
                          onTap: () => navigateToDetail(doc),
                        ),
                      ),
//                      IconButton(
//                        icon: Icon(
//                          Icons.delete,
//                          color: Colors.redAccent,
//                        ),
//                        onPressed: () => deleteData(doc), //funciona
//                      ),
                      IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.blueAccent,
                        ),
                        onPressed: () => navigateToDetail(doc),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(
//          Icons.add,
//          color: Colors.white,
//        ),
//        backgroundColor: Colors.pinkAccent,
//        onPressed: () {
//          Route route = MaterialPageRoute(builder: (context) => MyAddPage());
//          Navigator.push(context, route);
//        },
//      ),
    );
  }
}

