import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String donasi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donasi', style: TextStyle(color: Colors.white),),
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
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.fill
            )
        ),
        child: ListView(
          //padding: EdgeInsets.all(8),
          children:<Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                //color: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 330,
                      child: Card(
                        elevation: 10,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 90, top: 20),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                //color: Colors.grey,
                                image: DecorationImage(
                                  image: AssetImage('assets/donation.png'),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 120, 20, 20),
                                child: Column(
                                  children: <Widget>[
                                    Text("Mari bantu kami merubah kehidupan hewan - hewan terlantar dengan berdonasi dan jadilah pahlawan bagi mereka."
                                        "\n\nSetiap donasi, berapapun jumlah nya akan di salurkan ke beberapa pet shelter."
                                        " Donasimu hari ini dapat memberikan kehidupan yang lebih baik bagi hewan - hewan.", textAlign: TextAlign.justify,),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Rp',
                          fillColor: Colors.grey[300],
                          filled: true,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        onSaved: (value) => donasi = value,
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),

                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.lightBlueAccent.shade100,
                          elevation: 5.0,
                          child:Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF185058),
                                    Color(0xFF008772)
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: MaterialButton(
                              minWidth: 200.0,
                              height: 42.0,
                              onPressed: (){},
                              child: Text('DONASI', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      )
    );
  }
}
