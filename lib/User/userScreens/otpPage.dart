import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/loginProvider.dart';
import '../../refactoring/myColor.dart';
import '../../refactoring/widget.dart';

class otpPage extends StatelessWidget {
  const otpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthh =MediaQuery.of(context).size.width;
    var heightt =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10,),
            height:heightt/(1.54),
            width: widthh,
            decoration:  BoxDecoration(
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset("assets/logo2.png"),
                ),

                   Text("OTP Verification",
                 style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w900,

                 ),
                   ),
                height(),



                // SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 90),
                  child: Column(
                    children: [
                      Consumer<LoginProvider>(
                        builder: (context,val,child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Pinput(
                                controller:val.OtpController,
                                length: 6,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                defaultPinTheme: PinTheme(
                                    textStyle:
                                    TextStyle(fontWeight: FontWeight.bold),
                                    height: 45,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: borderColor,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(width: 1,
                                            color:backColor.withOpacity(0.9)))),

                                onCompleted: (pin){
                                  val.loader?
                                  CircularProgressIndicator(color: Colors.white,):
                                  val.verify(context);

                                },
                                ),
                          );
                        }
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Tf(),
                      //     width(),
                      //     Tf(),
                      //     width(),
                      //     Tf(),
                      //     width(),
                      //     Tf(),
                      //     width(),
                      //     Tf(),
                      //     width(),
                      //     Tf(),
                      //   ],
                      // ),
                      SizedBox(height: 30,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blackc,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          maximumSize: Size(200,40),
                        ),
                        onPressed:(){
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>homePage()));
                        }, child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(width: 10,),
                          Text("Verify",style: TextStyle(
                            color: borderColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 19,
                          ),)
                        ],
                      ), ),
                    ],
                  ),
                ),





              ],
            )
        ),
      ),
    );
  }
}
