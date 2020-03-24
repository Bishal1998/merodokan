import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Mero Dokan"),
       centerTitle: true,
       backgroundColor: Colors.green,
       elevation: 0.0,
       actions: <Widget>[
         IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){}),
       ],
      ),
      body: ListView(
       children: <Widget>[
         Container(
           height: 250.0,
           child: GridTile(
             child: Container(
              color: Colors.white70,
              child: Image.asset(widget.product_detail_picture),
           ),
           footer: Container(
             color: Colors.white,
             child: ListTile(leading:Text(widget.product_detail_name, style: TextStyle(fontWeight: FontWeight.bold),),
             
             title: Row(
              children: <Widget>[
                Expanded(child: Text("\$${widget.product_detail_old_price}",style: TextStyle(decoration: TextDecoration.lineThrough),),),
                Expanded(child: Text("\$${widget.product_detail_new_price}")),
              ], 
             ),
             ),
           ),
           ),
           
         ),
         Row(
           children: <Widget>[
             Expanded(
               child: MaterialButton(
                 onPressed: (){
                   showDialog(context: context,
                   builder: (context){
                     return AlertDialog(
                       title: Text("Quantity"),
                       content: Text("Choose the quantity"),
                       actions: <Widget>[
                         MaterialButton(onPressed: (){
                           Navigator.of(context).pop(context);
                         },
                         child: Text("close"),)
                       ],
                     );
                   });
                 },
               color: Colors.white,
               textColor: Colors.grey,
               child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text("Quantity")
                  ),
                  Expanded(
                   child: Icon(Icons.arrow_drop_down)
                   ),
                ], 
               ),
          
               ),
               ),
           ],
         ),
         Row(children: <Widget>[
            Expanded(
              child: MaterialButton(onPressed: (){},
            color: Colors.green,
            textColor: Colors.white,
            elevation: 0.2,
            child: Text("Buy Now"),
            ),
            ),
            IconButton(icon: Icon(Icons.add_shopping_cart), color: Colors.green, onPressed: (){}),
            IconButton(icon: Icon(Icons.favorite), color: Colors.green, onPressed: (){}),
          ],
          ),
          Divider(),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text("t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),

          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8.0),
              child: Text("Product Name",style: TextStyle(color: Colors.green),)
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text(widget.product_detail_name),),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8.0),
              child: Text("Product Brand",style: TextStyle(color: Colors.green),)
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text("Gullon"),),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(8.0),
              child: Text("Product Condition",style: TextStyle(color: Colors.green),)
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text("New"),),
            ],
          ),
          Divider(),
          Padding(padding: EdgeInsets.all(8.0),
          child: Text("Related Products"),
          ),
          Container(
            height: 360.0,
            child: Related_Products(),
          ),
       ], 
      ),
    );
  }
}

class Related_Products extends StatefulWidget {
  @override
  _Related_ProductsState createState() => _Related_ProductsState();
}

class _Related_ProductsState extends State<Related_Products> {
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
        return Related_Single_prod(
          prod_name: product_list[index]['name'],
          prod_picture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Related_Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Related_Single_prod({
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