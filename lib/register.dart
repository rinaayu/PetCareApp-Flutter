import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/home.dart';
import 'package:pet_care/login.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email, _password, _nama, _ulangpassword;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    final regisText = Column(
      children: <Widget>[
        Text("REGISTRASI", style: TextStyle(color: Colors.teal[900], fontSize: 30,fontWeight:FontWeight.bold ),),
      ],
    );
    final form = Form(
        key : _formKey,

        child: Column(
          children: <Widget>[
            TextFormField(
              validator:(val )=> val.length == 0 ? "Masukkan Nama" : null,
              onSaved: (val) => _nama = val,
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.black38,
                  ),
                  hintText: 'Nama',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)
                  )
              ),
            ),
            Padding(
                padding : EdgeInsets.only(top: 16.0)
            ),
            TextFormField(
              validator:(val )=> val.length == 0 ? "Masukkan Email" : null,
              onSaved: (val) => _email = val,
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black38,
                  ),
                  hintText: 'Email',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)
                  )
              ),
            ),
            Padding(
                padding : EdgeInsets.only(top: 16.0)
            ),
            TextFormField(
              validator: (val){
                if(val.isEmpty){
                  return "Masukkan Password";
                }
                if(val.length<6){
                  return "Password Minimal 6 Karakter";
                }
                else{return null;}
              },
              //validator:(val)=> val.length == 0 ? "Masukkan Password" : null,
              onSaved: (val)=> _password = val,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black38,
                  ),
                  hintText: 'Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)
                  )
              ),
              obscureText: true,
              autofocus: false,
            ),
            Padding(
                padding : EdgeInsets.only(top: 16.0)
            ),
            TextFormField(

              validator: (val){
                if(val.isEmpty){
                  return "Masukkan Password";
                }
                if(val.length<6){
                  return "Password Minimal 6 Karakter";
                }
                else{return null;}
              },
              onSaved: (val)=> _ulangpassword = val,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black38,
                  ),
                  hintText: 'Ulangi Password',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0)
                  )
              ),
              obscureText: true,
              autofocus: false,
            )
          ],
        )
    );

    final regisButton = Padding(
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
            onPressed: validateForm,
            child: Text('DAFTAR', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
    final masukAkun = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Sudah Punya Akun?"),
          SizedBox(height: 60.0,),
          FlatButton(
            child: Text("LOGIN", style: TextStyle(color: Color.fromRGBO(114, 150, 101, 1))),
            onPressed: loginPage,
          )
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          //padding: EdgeInsets.only(left: 24.0,right: 24.0),
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  regisText,
                  SizedBox(height: 48.0,),
                  form,
                  SizedBox(height: 8.0,),
                  regisButton,
                  masukAkun
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
  Future<void> validateForm() async {
    print("Validasi Register");
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }catch(e){
        print(e.message);
      }
      print("Validasi Sukses");
    }else{
      print("Validasi Error");
    }
  }

  void loginPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
}