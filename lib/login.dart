import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag : 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 80.0,
        child: Image.asset('assets/LOGO.PNG'),
      )

    );
    final form = Form(
      key : _formKey,

      child: Column(
        children: <Widget>[
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

            validator: (val )=> val.length == 0 ? "Masukkan Password" : null,
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
          )
        ],
      )
    );

//    final email = TextFormField(
//      key: formKey,
//      validator: (val )=> val.length == 0 ? "Masukkan Email" : null,
//      keyboardType: TextInputType.emailAddress,
//      autofocus: false,
//      decoration: InputDecoration(
//        prefixIcon: Icon(
//          Icons.email,
//          color: Colors.black38,
//        ),
//        hintText: 'Email',
//        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//        border: OutlineInputBorder(
//          borderRadius: BorderRadius.circular(32.0)
//        )
//      ),
//    );
//
//    final password = TextFormField(
//      key: formKey,
//      validator: (val )=> val.length == 0 ? "Masukkan Password" : null,
//      autofocus: false,
//      obscureText: true,
//      decoration: InputDecoration(
//          prefixIcon: Icon(
//            Icons.lock,
//            color: Colors.black38,
//          ),
//          hintText: 'Password',
//          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//          border: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(32.0)
//          )
//      ),
//    );

    final loginButton = Padding(
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
          child: Text('LOGIN', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
      final daftarAkun = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Belum Punya Akun?"),
            SizedBox(height: 60.0,),
            FlatButton(
                child: Text("DAFTAR", style: TextStyle(color: Color.fromRGBO(114, 150, 101, 1))),
              onPressed: (){},
            )
          ],
        ),
      );
//    final daftarAkun = FlatButton(
//      child : Text(
//        'Belum Punya Akun ? DAFTAR',
//        style: TextStyle(color: Colors.black54),
//      ),
//      onPressed:(){} ,
//    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0,right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0,),
            form,
            SizedBox(height: 8.0,),
            loginButton,
            daftarAkun
          ],
        ),
      ),
    );
  }
  void validateForm(){
    print("Validasi Login");
    if(_formKey.currentState.validate()){
      print("Validasi Sukses");
    }else{
      print("Validasi Error");
    }
  }
}
