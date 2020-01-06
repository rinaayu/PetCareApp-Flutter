import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';
//import 'package:path/path.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfile> {
  File _image;

  @override
  Widget build(BuildContext context) {

//    Future getImage() async {
//      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//      setState(() {
//        _image = image;
//        print('Image Path $_image');
//      });
//    }

    Future uploadPic(BuildContext context) async{
      //String fileName = basename(_image.path);
     // StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
      //StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      //StorageTaskSnapshot taskSnapshot=await uploadTask.onComplete;
      setState(() {
        print("Profile Picture uploaded");
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xFF185058),

        title: Text('Edit Profi', style: TextStyle(color: Colors.white),),
      ),
      body: Builder(
         builder: (context) =>  Container(
           child: Center(
            child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Color(0xFF185058),
                      child: ClipOval(
                        child: new SizedBox(
                          width: 130.0,
                          height: 130.0,
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/pp.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                      onPressed: () {
                        //getImage();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Username',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18.0)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Dea Amanda',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        Icons.edit,
                        color: Color(0xFF185058),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Birthday',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18.0)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('18 Oktober 1998',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        Icons.edit,
                        color: Color(0xFF185058),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Location',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 18.0)),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Medan, Indonesia',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      child: Icon(
                        Icons.edit,
                        color: Color(0xFF185058),
                      ),
                    ),
                  ),
                ],
              ),
               SizedBox(
                 height: 20.0,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   Align(
                     alignment: Alignment.centerLeft,
                     child: Container(
                       child: Column(
                         children: <Widget>[
                           Align(
                             alignment: Alignment.centerLeft,
                             child: Text('Email',
                                 style: TextStyle(
                                     color: Colors.blueGrey, fontSize: 18.0)),
                           ),
                           Align(
                             alignment: Alignment.centerLeft,
                             child: Text('dea@gmail.com',
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 20.0,
                                     fontWeight: FontWeight.bold)),
                           ),
                         ],
                       ),
                     ),
                   ),
                   Align(
                     alignment: Alignment.centerRight,
                     child: Container(
                       child: Icon(
                         Icons.edit,
                         color: Color(0xFF185058),
                       ),
                     ),
                   ),
                 ],
               ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Color(0xFF185058),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  RaisedButton(
                    color: Color(0xFF185058),
                    onPressed: () {
                      uploadPic(context);
                    },

                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}