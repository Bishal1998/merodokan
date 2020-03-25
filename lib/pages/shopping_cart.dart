import 'package:flutter/material.dart';
import 'package:merodokan/userScreen/cart_products.dart';
class Shopping_Cart extends StatefulWidget {
  @override
  _Shopping_CartState createState() => _Shopping_CartState();
}

class _Shopping_CartState extends State<Shopping_Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
       title: Text("Mero Saman"),
       centerTitle: true,
       backgroundColor: Colors.green,
       elevation: 0.0,
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){}),
       ],
      ),
      body: Cart_Product(),
      bottomNavigationBar: Container(
       color: Colors.green,
       child: Row(
         children: <Widget>[
           Expanded(child: ListTile(title: Text("Total: "),subtitle: Text("\$230"),)),
           Expanded(child: MaterialButton(onPressed: (){},
           child: Text("Check Out",style: TextStyle(color: Colors.green),
           ),
           color: Colors.white,
           ),),
         ],
       ), 
      ),
    );
  }
}