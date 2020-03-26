import 'package:flutter/material.dart';
import 'package:merodokan/userScreen/MyHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;
  @override
  void initState(){
    super.initState();
    isSignedIn();
      }
      
      void isSignedIn() async{
        setState(() {
          loading = true;
        });
        preferences = await SharedPreferences.getInstance();
        isLoggedin = await googleSignIn.isSignedIn();
        if(isLoggedin){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        }
        setState(() {
          loading = false;
        });
      }

      Future handleSignIn() async{
        preferences = await SharedPreferences.getInstance();

        setState(() {
          loading = true;
        });

        GoogleSignInAccount googleUser = await googleSignIn.signIn();
        GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
        FirebaseUser firebaseUser = await firebaseAuth.signinWithGoogle(idToken: googleSignInAuthentication, idToken: googleSignInAuthentication.accessToken);

        if(firebaseUser !=null){
          final QuerySnapshot result = await Firestore.instance.collection("users").where("id",isEqualTo: firebaseUser.uid).getDocuments();
          final List<DocumentSnapshot> documents = result.documents;
          if(documents.length == 0){
            Firestore.instance.collection("users").document(firebaseUser.uid).setData({
              "id": firebaseUser.uid,
              "username": firebaseUser.displayName,
              "profilePicture": firebaseUser.photoUrl
            });
              await preferences.setString("id", firebaseUser.uid);
              await preferences.setString("username", firebaseUser.displayName);
              await preferences.setString("profilePicture", firebaseUser.photoUrl);
          }else{
            await preferences.setString("id", documents[0]['id']);
            await preferences.setString("username", documents[0]['username']);
            await preferences.setString("profilePicture", documents[0]['profilePicture']);
          }
          Fluttertoast.showToast(msg: "Successfully Login !!");
          setState(() {
            loading = false;
          });

        }else{

        }
      }
      
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
           backgroundColor: Colors.white,
           centerTitle: true,
           title: Text("Login",style: TextStyle(color: Colors.green),),
           elevation: 0.1, 
          ),
          body: Stack(
           children: <Widget>[
             Center(child: FlatButton(
               color: Colors.green.shade100,
               onPressed: (){
               handleSignIn();
             }, child: Text("Sign in / Sign up with Google", style: TextStyle(color: Colors.white))),
             ),
             Visibility(
               visible: loading ?? true,
               child: Center(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white.withOpacity(0.7),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>[Colors.green],
                  ),
                ), 
               ),
             ),
           ], 
          )
        );
      }
}