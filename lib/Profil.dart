

//Kemudian buat file profile.dart di dalam folder lib dan tambahkan kerangka berikut

import 'package:flutter/material.dart';
import 'package:pet_care/Posting.dart';
import 'package:pet_care/edit_profile.dart';

import 'package:pet_care/post.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();

}

class _ProfilState extends State<Profil> with TickerProviderStateMixin {
  //VARIABLE INI NNTINYA KITA GUNAKAN UTK PROFILE PICTURE
  final urlProfile = 'https://en.wikipedia.org/wiki/Cat#/media/File:Kittyply_edit1.jpg';


  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //SET TAB CONTROLLERNYA DENGAN PROPERTI LENGTHNYA ADALAH 2
    //YANG BERARTI TAB-NYA NANTI MEMILIKI DUA BAGIAN
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //KARENA BAGIAN TITLE TERDIRI DARI DUA COMPONENT, MAKA KITA MASUKKAN KE DALAM ROW
        title: Row(
          children: <Widget>[
            //UNTUK TEKS DAN ICON SALING BERDEKATAN
            Text('Profil', style: TextStyle(color: Colors.black)),
          ],
        ),
        //SEDANGKAN HUMBERGER MENU ADA DI SEBELAH KANAN MAKA KITA GUNAKAN ACTIONS DARI APPBAR
        actions: <Widget>[Icon(Icons.exit_to_app, color: Colors.black)],
        backgroundColor: Colors.white,
      ),
      body: Container(
        //JADI KITA GUNAKAN SEBUAH COLUMN KARENA ADA BANYAK  COMPONENT YANG AKAN TERSUSUN KEBAWAH
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LastViewed(), //CLASS INI UNTUK MENAMPILKAN JUMLAH VISITOR YANG MELIHAT PROFILE
            //CLASS INI UNTUK INFORMASI PROFILE SEPERTI PP, JUMLAH POST, FOLLOWING DAN FOLLOWERS
            ProfileInformation(urlProfile: urlProfile),
            ProfileDescription(), //BAGIAN INI UNTUK NAMA PROFILE, DESC DAN KATEGORI
            ShortcutButton(), //3 TOMBOL SEBELUM POSTS
            Divider(), //BUAT GARIS UNTUK MEMISAHKAN DENGAN TAB
            ListPosts(tabController: _tabController), //TAB BESERTA LIST POSTSNYA
          ],
        ),
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

class ListPosts extends StatelessWidget {
  //KARENA DISINI MENGGUNAKAN TAB, MAKA KITA MINTA TABCONTROLLERNYA YANG SUDAH DI DEFINISIKAN PADA KERANGKA DIAWAL SETELAH URL PROFIL PIC
  const ListPosts({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //KARENA ADA DUA BAGIAN, YAKNI TABBAR DAN TABBAR VIEW MAKA KITA GUNAKAN COLUMN
      //SEBENARNYA BISA SAJA TIDAK MENGGUNAKAN COLUMN KARENA YANG MELOAD CLASS INI ADA DI DALAM COLUMN
      child: Column(
        children: <Widget>[
          //BAGIAN TABBARNYA
          TabBar(
            controller: _tabController, //KITA GUNAKAN TABBAR CONTROLLER
            //DAN MENGATUR PROPERTI LAINNYA
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              //KARENA LENGTH DARI TAB ADALAH 2, MAKA KITA TAMBAHKAN 2 BUAH TAB ICON
              Tab(icon: Icon(Icons.border_all)),
              Tab(icon: Icon(Icons.assignment_ind)),
            ],
          ),
          Expanded(
            //ADAPUN TABBAR VIEWNYA BERLAKU HAL YANG SAMA
            child: TabBarView(
              controller: _tabController, //CONTROLLERNYA DI ASSIGN
              children: <Widget>[
                //ADA DUA BAGIAN VIEW, UNTUK VIEW TAB PERTAMA MENGGUNAKAN GRID VIEW
                //KARENA AKAN ME-LOOPING 3 BUAH URL GAMBAR
                GridView.count(
                  physics: ScrollPhysics(),
                  crossAxisCount: 3, //JUMLAH GRIDNYA ADA BERAPA DERETAN
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 3.0, //MENGATUR JARAK OBJEK ATAS DAN BAWAH
                  crossAxisSpacing: 3.0, //MENGATUR JARAK OBJEK KIRI DAN KANAN
                  //CHILDNYA ADALAH SEBUAH LISTS ATAU ARRAY YANG DILOOPING MENGGUNAKAN MAP
                  children: <String>[
                    'https://upload.wikimedia.org/wikipedia/commons/f/fb/Kemra2.jpg',
                    'https://upload.wikimedia.org/wikipedia/id/2/2d/Kucing_Siam.jpg',
                    'https://upload.wikimedia.org/wikipedia/id/6/6f/KucingHimalaya.jpg'
                  ].map((String url) {
                    //KEMUDIAN TIAP GAMBAR DIWRAP DENGAN GESTUREDETECTOR
                    return GestureDetector(
                      //DIMANA KETIKA DITAP AKAN BERPINDAH KE HALAMAN SELANJUTNYA
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Post(url)));
                      },
                      //DAN KETIKA MENAMPILKAN GAMBARNYA KITA GUNAKAN WRAP DENGAN GRIDTILE
                      child: GridTile(
                        //DAN ANIMASI TRANSISINYA MENGGUNAKAN HERO SEPERTI YANG SUDAH DIJELASKAN SEBELUMNYA
                        //KEMUDIAN AMBIL GAMBAR DARI URL HASIL LOOPING DI ATAS
                        child: Hero(tag: url, child: Image.network(url, fit: BoxFit.cover)),
                      ),
                    );
                  }).toList(),
                ),
                //TAB VIEW KE DUA KITA TAMPILKAN KOTAK KOSONG SAJA
                Container(
                  height: 100,
                  color: Colors.pinkAccent,
                  child: Center(
                    child: Text('Profil'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShortcutButton extends StatelessWidget {
  const ShortcutButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //KONSEPNYA SAMA, KARENA DERETANNYA KE KANAN MAKA GUNAKAN ROW()
      child: Row(
        //MASING2 CHILD DIBUAT SPACE DISEKITARNYA
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //DAN TIAP BUTTON KITA GUNAKAN RAISEDBUTTON DENGAN TEKSNYA MASING-MASING
          RaisedButton(
            onPressed: (){Route route = MaterialPageRoute(builder: (context) => EditProfile());
            Navigator.push(context, route);},
            child: Text('Edit Profile'),
            color: Colors.white,
//          ),
//          RaisedButton(
//            onPressed: () {},
//            child: Text('Promotions'),
//            color: Colors.white,
//          ),
//          RaisedButton(
//            onPressed: () {},
//            child: Text('Contact'),
//            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class ProfileDescription extends StatelessWidget {
  const ProfileDescription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      //ADA 4 BAGIAN YANG MEMBENTUK LIST SECARA VERTICAL, MAKA COLUMN MENGAMBIL PERANNYA
      //SEMUANYA MUDAH KARENA HANYA MENAMPILKAN TEKS BIASA SAJA
       child: Container(
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Center(child: Text(
            "Dea Amanda",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          )),
          Center(child: Text(
            "dea@gmail.com",
            style: TextStyle(color: Colors.grey),
          )),
              Center(child: Text(
            "I love my cats more than I love most people",
          )),
          Text(
            "",
            style: TextStyle(color: Colors.blue),
          ),
        ],
      ),
    ));
  }
}

class ProfileInformation extends StatelessWidget {
  //KITA MEMINTA ATAU MENERIMA DATA BERUPA URL PROFILE
  //JIKA DILIHAT DARI KERANGKA SEBELUMNYA, DIMANA KETIKA CLASS INI DIPANGGIL
  //MAKA TERDAPAT VARIABLE YANG DIPASSING
  const ProfileInformation({
    Key key,
    @required this.urlProfile,
  }) : super(key: key);

  final String urlProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: const EdgeInsets.all(10),
      //ADA 4 BAGIAN YANG BERURUT SECARA HORIZONTAL, MAKA MENGGUNAKAN ROW

        //ATTRIBUTENYA DI-SET SPACE BETWEEN AGAR TIAP COMPONENT MEMILIKI SPACE

      child: Center(
       child: Container(
          width: 100, //DENGAN UKURAN PXL ADALAH 100
          height: 100,
          //KEMUDIAN MENGUGNAKAN CLIPRREACT UNTUK MEMBUAT LINGKARAN
          child: ClipRRect(
            //SET BORDER RADIUSNYA SETENGAH DARI UKURANNYA AGAR MEMBENTUK LINGKARAN
            borderRadius: BorderRadius.circular(50),
            //AMBIL GAMBAR DARI INTERNET
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/pp.jpg'),
            ),

            ),
          ),
        ),
      );
  }
}

class LastViewed extends StatelessWidget {
  const LastViewed({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color gradientStart = Color(0xFF185058); //Change start gradient color here
    Color gradientEnd = Color(0xFF008772);

    return Stack(
        alignment: Alignment.center,
        children: <Widget>[
// background image and bottom contents
      Column(
          children: <Widget>[
        Container(
            height: 50,
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [gradientStart, gradientEnd],
                ),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
          child: Center(
            child: Text('Pet Care',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                  fontStyle: FontStyle.italic)),
        )
    )
    ])
        ]);


  }
}

