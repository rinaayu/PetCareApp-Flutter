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
  TextEditingController priceInputController;
  String id;
  final db = Firestore.instance;
   String name;
  String jenis;
  String price;

  navigateToDetail(DocumentSnapshot ds) {

  }


  navigateToInfo(DocumentSnapshot ds) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(
              ds: ds,
            )));
  }

  @override
  Widget build(BuildContext context) {
    CommonThings.size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
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
        title: Text('Adopsi', style: TextStyle(color: Colors.white),),
        
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
                  crossAxisCount: 2,
                  mainAxisSpacing: 0.1,
                  childAspectRatio: 0.800,
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
                              subtitle:
                              Text(
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
                                      onPressed: () {},
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
        backgroundColor: Color(0xFF185058),
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => PostPage());
          Navigator.push(context, route);
        },
      ),
    );
  }
}
