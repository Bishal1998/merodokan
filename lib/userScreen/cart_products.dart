import 'package:flutter/material.dart';

class Cart_Product extends StatefulWidget {
  @override
  _Cart_ProductState createState() => _Cart_ProductState();
}

class _Cart_ProductState extends State<Cart_Product> {
  var Products_on_the_cart=[
    {
      "name": "Biscuits",
      "picture":"img/biscuits.jpg",
      "price":20,
      "quantity":5,
    },
    {
      "name": "Britania",
      "picture":"img/britania.jpg",
      "price":50,
      "quantity":2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Products_on_the_cart.length,
      itemBuilder: (context, index){
        return Single_cart_product(
          cart_prod_name: Products_on_the_cart[index]['name'],
          cart_prod_picture: Products_on_the_cart[index]['picture'],
          cart_prod_price: Products_on_the_cart[index]['price'],
          cart_prod_quantity: Products_on_the_cart[index]['quantity'],
        );
      },
      );
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_quantity;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_quantity
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_picture,
        width: 80.0,height: 100.0,),
        title: Text(cart_prod_name),
        subtitle: Column(
         children: <Widget>[
           Row(
             children: <Widget>[
              //  Padding(padding: EdgeInsets.all(8.0),
              //  child: Text("Quantity: "),
              //  ),
              //  Padding(padding: EdgeInsets.all(8.0),
              //  child: Text("cart_prod_quantity"),
              //  ),
               Padding(padding: EdgeInsets.all(0.0),
               child: Text("Price: "),
               ),
               Padding(padding: EdgeInsets.all(0.0),
               child: Text("\$$cart_prod_price",
               style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold)),
               ),
             ],
           ),
         ], 
        ),
        trailing: SingleChildScrollView(
            child: Column(
           children: <Widget>[
             IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
             Text("$cart_prod_quantity"),
             IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){}),
           ], 
          ),
        ),
      ),
    );
  }
}