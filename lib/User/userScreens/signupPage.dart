import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Admin/AdminScreens/AdminHome.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/User/userScreens/loginPage.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/widget.dart';

import '../../refactoring/myColor.dart';



class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthh =MediaQuery.of(context).size.width;
    var heightt =MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
            height:heightt/(1.42),
            width: widthh,
            decoration:  const BoxDecoration(
                boxShadow:[BoxShadow(
                  color: Colors.black54,
                  offset: Offset(3,5),
                  blurRadius: 2,
                ),] ,
                color: Color(0xff005F5F),
                borderRadius: BorderRadius.all(Radius.circular(20))

            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: ImageIcon(AssetImage("assets/backIcon.png"))),
                      SizedBox(width: 100,),
                      Text("Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,

                      ),
                      )
                    ],
                  ),
                ),
                // SizedBox(height: 50,),
                Column(
                  children: [
                    Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return NameTff("Full Name",val.userNameController,"Please Enter Your Name");
                      }
                    ),
                    height(),
                    Consumer<MainProvider>(
                        builder: (context,val,child) {
                          return Tff6("Email Id",val.userEmailController);
                        }
                    ),

                    height(),
                    Consumer<MainProvider>(
                        builder: (context,val,child) {
                          return PhoneNumberTff("Phone Number",val.userPhoneController);
                        }
                    ),

                  ],
                ),




                // SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blackc,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          minimumSize: Size(260,40),
                        ),
                        onPressed:(){
                          val.SignUserUp();
                          callNextReplacement(context, login());
                        }, child:
                      Text("Sign up",style: TextStyle(
                        color: borderColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                      ),), );
                    }
                  ),
                ),
                // SizedBox(height: 65,)



              ],
            )
        ),
      ),
    );
  }
}
