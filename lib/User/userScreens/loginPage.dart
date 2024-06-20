import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/loginProvider.dart';
import 'package:vantal/User/userScreens/otpPage.dart';
import 'package:vantal/User/userScreens/signupPage.dart';

import '../../Providers/mainProvider.dart';
import '../../refactoring/myColor.dart';



class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore db = FirebaseFirestore.instance;
    LoginProvider provider= Provider.of<LoginProvider>(context,listen: false);
    MainProvider provider2= Provider.of<MainProvider>(context,listen: false);
    var width =MediaQuery.of(context).size.width;
    var height =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height:height/(1.54),
            width: width,
            decoration:  BoxDecoration(
              boxShadow:[BoxShadow(
                color: Colors.black54,
                offset: Offset(3,5),
                blurRadius: 2,
              ),] ,
              color: tealColor,
              borderRadius: BorderRadius.all(Radius.circular(20))

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset("assets/logo2.png",scale: 1,),
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: width/1.25,

                    child: Consumer<LoginProvider>(
                      builder: (context,val,child) {
                        return TextFormField(
                          controller: val.phoneController,
                          inputFormatters: [LengthLimitingTextInputFormatter(10)],
                          keyboardType: TextInputType.number,
                          cursorColor: borderColor,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: borderColor)
                              ),
                            labelText:"Enter Your Phone Number",labelStyle: TextStyle(
                            color: borderColor,
                            fontWeight: FontWeight.w400,

                          ),
                            prefixIcon: Icon(Icons.phone,color: borderColor,),
                          //     hintText:"Enter Your Phone Number",hintStyle:  TextStyle(
                          //   color: borderColor,
                          //   fontWeight: FontWeight.w400,
                          //
                          // ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11)
                              )

                          ),


                        );
                      }
                    ),
                  ),
                  SizedBox(height: 30,),
                  Consumer<LoginProvider>(
                    builder: (context,value,child) {
                      return value.loader?
                      CircularProgressIndicator(color: Colors.white,): ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blackc,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          maximumSize: Size(260,40),
                        ),
                        onPressed:(){
                          if(value.phoneController.length==10) {
                          db.collection("USERS").where("USER_PHONE",isEqualTo:"+91"+value.phoneController.text).get().then((value){
                            if(value.docs.isNotEmpty){
                              provider.sendotp(context);

                            }
                            else{
                              const snackBar = SnackBar(
                                  backgroundColor: Colors.white,
                                  duration: Duration(milliseconds: 3000),
                                  content: Text("Sorry , You don't have any access",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ));

                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            }
                             });

                          }

                        }, child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.login,color: borderColor,),
                          SizedBox(width: 10,),
                          Text("Log in",style: TextStyle(
                            color: borderColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                          ),)
                        ],
                      ), );
                    }
                  ),
                ],
              ),

                  // SizedBox(height: 30,),

                  // SizedBox(height: 60),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>signUp() ));
                    },
                    child: RichText(text: TextSpan(
                      text: "New User?",
                      style: TextStyle(fontSize: 17,
                      fontWeight: FontWeight.w600,
                        color: blackc,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: " Sign up",
                        style: TextStyle(fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: borderColor,

                        ),
                        )
                      ],
                    ),
                    ),
                  )


                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
