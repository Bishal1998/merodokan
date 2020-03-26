import 'package:flutter/material.dart';
import 'package:merodokan/pages/login.dart';

void main()=>runApp(MaterialApp(debugShowCheckedModeBanner: false,home: MyApp(),));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mero Dokan',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}
