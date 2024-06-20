import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/loginProvider.dart';
import 'package:vantal/User/userScreens/loginPage.dart';
import 'package:vantal/refactoring/myColor.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();


    FirebaseAuth auth=FirebaseAuth.instance;
    var loginUser= auth.currentUser;

    LoginProvider loginProvider=Provider.of<LoginProvider>(context,listen:false);

    Timer(const Duration(seconds: 6), () {
      if(loginUser==null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
      }else{
        loginProvider.userAuthorized(loginUser.phoneNumber, context);
      }
    });

  }


  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tealColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height/8.5,),
          Center(child: Column(
            children: [
              Image(image: AssetImage("assets/logo2.png")),
              Text("VANTAL",style: TextStyle(
                color: blackc,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),)
            ],
          )),
          SizedBox(height: height/9,),
          Center(child: Image.asset("assets/bm.png")),
          SizedBox(height: 15,),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Let's Start A New\nExperience",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 34,
              ),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Choose your favourite car,rent it\nand enjoy new experience!"
              ,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),),
          ),
        ],
      ),
    );
  }
}
