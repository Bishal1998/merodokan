import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:merodokan/pages/shopping_cart.dart';
import 'package:merodokan/userScreen/horizontal.dart';
import './Recentproducts.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
              AssetImage("img/biscuits.jpg"),
              AssetImage("img/britania.jpg"),
              AssetImage("img/nun.jpg"),
              AssetImage("img/sabun.png"),
              AssetImage("img/dettol.png"),
        ],
        autoplay: false,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
       title: Text("Mero Dokan"),
       centerTitle: true,
       backgroundColor: Colors.green,
       elevation: 0.0,
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){}),
         IconButton(icon: Icon(Icons.shopping_cart), color: Colors.white, onPressed: (){
           Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shopping_Cart()));
         })
       ],
      ),
      drawer: Drawer(
       child: ListView(
         children: <Widget>[
           UserAccountsDrawerHeader(accountName: Text("Bishal Paudel"), accountEmail: Text("bishalpaudel1998@gmail.com"), currentAccountPicture: GestureDetector(
             child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
             ),
           ),
           decoration: BoxDecoration(
            color: Colors.green, 
           ),
           ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
             ),
           ),
           InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.person),
             ),
           ),
           InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("My Orders"),
              leading: Icon(Icons.shopping_basket),
             ),
           ),
           InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Shopping_Cart()));
            },
            child: ListTile(
              title: Text("Shopping Cart"),
              leading: Icon(Icons.shopping_cart),
             ),
           ),
           InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Favourites"),
              leading: Icon(Icons.favorite),
             ),
           ),
          Divider(),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("About"),
              leading: Icon(Icons.help),
             ),
           ),
           InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.exit_to_app),
             ),
           ),
         ],
       ), 
      ),
      body: ListView(
       children: <Widget>[
         image_carousel,
         Padding(padding: EdgeInsets.all(8.0),
         child: Text("Categories"),
         ),
         horizontal(),
         Padding(padding: EdgeInsets.all(20.0),
         child: Text("Recent Products"),
         ),
         Container(
           height: 320.0,
           child: Product(),
         ),
       ], 
      ),
    );
  }
}