

import 'package:flutter/material.dart';
import 'package:pet_care/Posting.dart';
import 'package:pet_care/edit_profile.dart';

import 'package:pet_care/post.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();

}

class _ProfilState extends State<Profil> with TickerProviderStateMixin {

  final urlProfile = 'https://en.wikipedia.org/wiki/Cat#/media/File:Kittyply_edit1.jpg';


  TabController _tabController;

  @override
  void initState() {
    super.initState();
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
        elevation: 0.0,
       automaticallyImplyLeading: false,
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
        title: Center(child: Text('Profil', style: TextStyle(color: Colors.white),)),

      ),
      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LastViewed(),
            ProfileInformation(urlProfile: urlProfile),
            ProfileDescription(),
            ShortcutButton(),
            Divider(),
            ListPosts(tabController: _tabController),
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
  const ListPosts({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.border_all)),
              Tab(icon: Icon(Icons.assignment_ind)),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                GridView.count(
                  physics: ScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 3.0,
                  crossAxisSpacing: 3.0,
                  children: <String>[
                    'https://upload.wikimedia.org/wikipedia/commons/f/fb/Kemra2.jpg',
                    'https://upload.wikimedia.org/wikipedia/id/2/2d/Kucing_Siam.jpg',
                    'https://upload.wikimedia.org/wikipedia/id/6/6f/KucingHimalaya.jpg'
                  ].map((String url) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Post(url)));
                      },
                      child: GridTile(
                        child: Hero(tag: url, child: Image.network(url, fit: BoxFit.cover)),
                      ),
                    );
                  }).toList(),
                ),
                //TAB VIEW KE DUA KITA TAMPILKAN KOTAK KOSONG SAJA
                Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Center(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
            onPressed: (){Route route = MaterialPageRoute(builder: (context) => EditProfile());
            Navigator.push(context, route);},
            child: Text('Edit Profile'),
            color: Colors.white,
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
  const ProfileInformation({
    Key key,
    @required this.urlProfile,
  }) : super(key: key);

  final String urlProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
       child: Container(
          width: 100, //DENGAN UKURAN PXL ADALAH 100
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
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
            height: 10,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                gradient: new LinearGradient(
                  colors: [gradientStart, gradientEnd],
                ),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50))),
          child: Center(
            child: Text('',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                  )),
        )

    )
    ])
        ]);


  }
}

