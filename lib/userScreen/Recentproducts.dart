import 'package:flutter/material.dart';
import 'package:merodokan/pages/detail_page.dart';
import 'package:flutter/cupertino.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var product_list = [
    {
      "name": "Biscuits",
      "picture":"img/biscuits.jpg",
      "old_price":25,
      "price":20,
    },
    {
      "name": "Britania",
      "picture":"img/britania.jpg",
      "old_price":55,
      "price":50,
    },
    {
      "name": "Dettol",
      "picture":"img/dettol.png",
      "old_price":25,
      "price":20,
    },
    {
      "name": "Sabun",
      "picture":"img/sabun.png",
      "old_price":25,
      "price":20,
    },
    {
      "name": "Noon",
      "picture":"img/nun.jpg",
      "old_price":22,
      "price":20,
    },
    {
      "name": "Dtol",
      "picture":"img/dettol.png",
      "old_price":22,
      "price":20,
    },

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index){
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(tag: prod_name, 
      child: Material(
        child: InkWell(onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(product_detail_name: prod_name,
        product_detail_new_price: prod_price,
        product_detail_old_price: prod_old_price,
        product_detail_picture: prod_picture),)),
        child: GridTile(
         footer: Container(
          color: Colors.white70, 
          child: ListTile(
            leading: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: Text("\$$prod_price", style: TextStyle(color:Colors.green, fontWeight: FontWeight.bold),),
            subtitle: Text("\$$prod_old_price", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold,
            decoration: TextDecoration.lineThrough),),
          ),
         ),
        child: Image.asset(prod_picture,
        fit: BoxFit.cover),
        ),
        ),
      )),
    );
  }
}