import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final urlImage;
  final urlProfile = 'https://en.wikipedia.org/wiki/Cat#/media/File:Kittyply_edit1.jpg';

  //TERIMA DATA PROFIL PIC YANG AKAN DILIHAT
  Post(this.urlImage);

  @override
  Widget build(BuildContext context) {
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
        title: Text('Posts', style: TextStyle(color: Colors.white),),

      ),
      body: Container(
        //LAGI LAGI KITA GUNAKAN COLUMN UNTUK MENGATUR LAYOUT SECARA VERTICAL
        //DIMANA TERDIRI DARI 4 BAGIAN, PERTAMA ADALAH INFO PEMILIK
        //KEDUA ADALAH GAMBAR POST
        //KETIGA ADALAH INSIGHT DAN PROMOTE BUTTON
        //KEEMPAT ADALAH TOMBOL LOVE, COMMENT DAN SETERUSNYA
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //BAGIAN PERTAMA TERKAIT PENGGUNA
            Padding(
              padding: const EdgeInsets.all(10.0),
              //ADA 3 ELEMEN BERDERET KE SAMPING, PERTAMA GAMBAR, TEKS DAN ICON
              //MAKA KITA GUNAKAN ROW UNTUK MENGATUR KETIGA ELEMEN TERSEBUT
              child: Row(
                children: <Widget>[
                  //BAGIAN PERTAMA GAMBAR, ADAPUN PENJELASANYA SAMA SEPERTI SEBELUMNYA YAKNI SEBUAH CONTAINER YANG SUDAH DI-SET BESAR UKURANNYA
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 40,
                    width: 40,
                    //KEMUDIAN GAMBARNYA DIWRAP DENGAN CLIPRREACT UNTUK MEMBUAT LENGKUNGAN LINGKARAN
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      //DAN LOAD GAMBARNYA DARI URL YANG ADA DI VARIABLE urlprofile
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/pp.jpg'),
                      ),
                    ),
                  ),
                  //NAMA PENGGUNA
                  Text(
                    "dea",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  //ANTAR NAMA DAN ICON DIPISAHKAN DENGAN JARAK, MAKA KITA GUNAKAN SPACER
                  Spacer(
                    flex: 1,
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
            //NEXT ADALAH GAMBAR DARI POST YANG DIKLIK
            Container(
              //DIWRAP DENGAN HERO ANIMATION AGAR MEMBUAT EFEK TRANSISI
              child: Hero(tag: urlImage, child: Image.network(urlImage, fit: BoxFit.cover,)),
              //WIDTHNYA DIBUAT SELEBAR MUNGKIN
              width: double.infinity,
              //DAN TINGGINYA SEPERTIGA DARI BESAR LAYAR
              height: MediaQuery.of(context).size.height / 3,
            ),
            //BAGIAN INI ADALAH INSIGHT DAN PROMOSI, HANYA BERISI TEKS DAN TOMBOL

            //BUAT GARIS PEMISAH
            Divider(),
            //BAGIAN INI ADALAH KUMPULAN ICON YANG ADA DIBAWAH
            //KARENA ADA 4 ICON MAKA GUNAKAN ROW LAGI
            Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8),
                child: Icon(Icons.favorite_border),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.comment),
              ),
              Icon(Icons.send),
              Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.filter_frames),
              )
            ],),
            //YANG TERAKHIR ADALAH INFORMASI KAPAN POST TERSEBUT DIPOSTING
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Desember, 24, 2018", style: TextStyle(color: Colors.grey, fontSize: 12),),
            )
          ],
        ),
      ),
    );
  }
}