import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_care/navigasi.dart';

class UserManagement{
  storeNewUser(user, context){
    Firestore.instance.collection('users').document().setData({
      'email' : user.email,
      'uid' : user.uid,
      'username' : user.displayName,
      'photoUrl' : user.photoUrl
    }).then((value){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_){
          return Navigasi();
        })
      );
    }).catchError((e){
      print(e);
    });
  }
}