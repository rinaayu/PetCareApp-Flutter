import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:pet_care/adopsi.dart';
import 'package:pet_care/donasi.dart';
import 'package:pet_care/pet_shelter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      height: 160,
      width: 100,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('assets/banner.png'),
          AssetImage('assets/banner2.png'),
          AssetImage('assets/animals-pets-banner.jpg'),
        ],
        autoplay: true,
        indicatorBgPadding: 2.0,
        dotSize: 2.0,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text('PetCare', style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings), color: Colors.grey[300], onPressed: (){})
        ],
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
        color: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            imageCarousel,
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AdoptionPage())),
                  child: MenuUtamaItem(
                    title: 'Adopsi',
                    images: 'assets/cat.png',
                    colorBox: Colors.white,
                  )
                ),
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DonationPage())),
                  child: MenuUtamaItem(
                    title: 'Donasi',
                    images: 'assets/donation.png',
                    colorBox: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PetShelterPage())),
                  child: MenuUtamaItem(
                    title: 'Pet Shelter',
                    images: 'assets/pet-shelter.png',
                    colorBox: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
//class MenuUtama extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return GridView.count(
//      shrinkWrap: true,
//      crossAxisCount: 3,
//      children: menuUtamaItem,
//    );
//  }
//}
//List<MenuUtamaItem> menuUtamaItem = [
//  MenuUtamaItem(
//    title: 'Adopsi',
//    images: 'assets/cat.png',
//    colorBox: Colors.white,
//  ),
//  MenuUtamaItem(
//    title: 'Donasi',
//    images: 'assets/donation.png',
//    colorBox: Colors.white,
//  ),
//  MenuUtamaItem(
//    title: 'Pet Shelter',
//    images: 'assets/pet-shelter.png',
//    colorBox: Colors.white,
//  )
//];
class MenuUtamaItem extends StatelessWidget {
  MenuUtamaItem({this.title, this.images, this.colorBox});
  final String title;
  final String images;
  final Color colorBox;
  @override
     Widget build(BuildContext context) {
       return Column(
         children: <Widget>[
           Container(
             height: 85.0,
             width: 150.0,
             decoration: BoxDecoration(
               color: colorBox,
               shape: BoxShape.rectangle,
               boxShadow: [
                 BoxShadow(
                   color: Colors.grey[500].withOpacity(0.4),
                   spreadRadius: 2,
                   blurRadius: 9
                 )
               ]
             ),
             child: Image.asset(images,scale: 9,),
           ),
           Padding(
             padding: const EdgeInsets.only(top : 6.0),
             child: Text(title, style: TextStyle(fontSize: 13.0,fontWeight: FontWeight.w500, color: Colors.grey[800]),),
           )
         ],
       );
     }
    }
