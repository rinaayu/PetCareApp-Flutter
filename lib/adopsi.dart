import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/details.dart';
import 'package:pet_care/post.dart';

class CommonThings {
  static Size size;
}

class AdoptionPage extends StatefulWidget {
  @override
  _AdoptionPageState createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {

  TextEditingController jenisInputController;
  TextEditingController nameInputController;
  String id;
  final db = Firestore.instance;
  //final _formKey = GlobalKey<FormState>();
  String name;
  String jenis;

  //create tha funtion navigateToDetail
  navigateToDetail(DocumentSnapshot ds) {
//    Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => MyUpdatePage(
//              ds: ds,
//            )));
  }

  //create tha funtion navigateToDetail
  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
              ds: ds,
            )));
  }


//  void deleteData(DocumentSnapshot doc) async {
//    await db.collection('CRUD').document(doc.documentID).delete();
//    setState(() => id = null);
//  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Adopsi'),
        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.list),
//            tooltip: 'List',
//            onPressed: () {
//              Route route = MaterialPageRoute(builder: (context) => MyListPage());
//              Navigator.push(context, route);
//            },
//          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
//              Route route = MaterialPageRoute(builder: (context) => MyQueryPage());
//              Navigator.push(context, route);
            },
          ),
        ],
      ),
      body: StreamBuilder(
          stream: Firestore.instance.collection("posts").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Text('"Loading...');
            }
            int length = snapshot.data.documents.length;
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //two columns
                  mainAxisSpacing: 0.1, //space the card
                  childAspectRatio: 0.800, //space largo de cada card
                ),
                itemCount: length,
                padding: EdgeInsets.all(2.0),
                itemBuilder: (_, int index) {
                  final DocumentSnapshot doc = snapshot.data.documents[index];
                  return new Container(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () => navigateToDetail(doc),
                                child: new Container(
                                  child: Image.network(
                                    '${doc.data["image"]}' + '?alt=media',
                                  ),
                                  width: 170,
                                  height: 120,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text(
                                doc.data["name"],
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 19.0,
                                ),
                              ),
                              subtitle: Text(
                                doc.data["jenis"],
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 12.0),
                              ),
                              onTap: () => navigateToDetail(doc),
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: new Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {}, //funciona
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.blueAccent,
                                      ),
                                      onPressed: () => navigateToInfo(doc),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => PostPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
