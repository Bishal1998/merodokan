import 'package:flutter/material.dart';

class horizontal extends StatefulWidget {
  @override
  _horizontalState createState() => _horizontalState();
}

class _horizontalState extends State<horizontal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
       children: <Widget>[
         Category(
           image_location: "img/biscuits_icon.png",
           image_caption: 'Biscuits',
         ),
         Category(
           image_location: "img/soap_icon.png",
           image_caption: 'Soap',
         ),
         Category(
           image_location: "img/cold_icons.png",
           image_caption: 'Cold Drinks',
         ),
         Category(
           image_location: "img/noodles_icon.png",
           image_caption: 'Noodles',
         ),
       ], 
      )
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;

  Category({
    this.image_location,
    this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
    child: InkWell(onTap: (){},
    child: Container(
      width: 100.0,
          child: ListTile(
        title: Image.asset(image_location,
        width: 100.0,
        height: 80.0,
        ),
        subtitle: Container(
          alignment: Alignment.topCenter,
          child: Text(image_caption),
        ),
      ),
    ), 
    ),
      
    );
  }
}