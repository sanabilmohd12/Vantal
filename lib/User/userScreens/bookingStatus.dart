import 'package:flutter/material.dart';
import 'package:vantal/User/userScreens/homePage.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';
import '../../refactoring/widget.dart';

class StatusPage extends StatelessWidget {
  String vImage;
  String vCompany;
  String vName;
  String logo;
  String pickUpDate;
  String endDate;

  StatusPage({Key? key,
  required this.vImage,
  required this.vCompany,
    required this.vName,
    required this.logo,
    required this.pickUpDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: ()async {
       return callNextReplacement(context, homePage(userId: "", uName: "", uEmaild: "", uPhone: ""));
      },
      child: Scaffold(
        backgroundColor: tealColor,
        appBar: AppBar(
          backgroundColor: tealColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined,color: borderColor,),
            onPressed: (){
              callNextReplacement(context, homePage(userId: "", uName: "", uEmaild: "", uPhone: ""));
            },
          ),
        ),
        body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20,top: 8,bottom: 20),
                child: Rtext(vCompany," ${vName}"),
              ),


              Image(image: NetworkImage(vImage)),
              SizedBox(height: 2.0), // Adjust the spacing as needed
              height(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 310,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white38),
                    borderRadius: BorderRadius.circular(20),


                  ),
                  child:Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(image: NetworkImage(logo),
                              width: 120,
                              height: 50,

                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(vName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),),
                                Text("Kunnapally",style: TextStyle(color: Colors.white70,fontSize: 14),)
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Mon-Sun 8:00-5:30",style: TextStyle(fontSize: 13,color: Colors.white),),
                                Text("9539846263",style: TextStyle(fontSize: 13,color: Colors.white),)
                              ],
                            ),


                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text("Rental Start On: ",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,fontSize: 16
                              ),),
                              SizedBox(width: 6,),
                              Text(pickUpDate,style: TextStyle(color: Colors.white70,fontSize: 16),)
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text("Rental End On: ",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,fontSize: 16
                              ),),
                              SizedBox(width: 6,),
                              Text(endDate,style: TextStyle(color: Colors.white70,fontSize: 16),)
                            ],
                          ),
                        ),
                        height2(),
                        Padding(
                          padding:  EdgeInsets.only(left: 12),
                          child: Row(
                            children: [
                              Text("Booking Status: ",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 26,
                              ),),

                              Text("PENDING",style: TextStyle(color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27),)
                            ],
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     Icon(Icons.circle,color: Colors.white,size: 17,),
                        //     SizedBox(width: 6,),
                        //     Text("Mon-Sun 8:00-5:30",style: TextStyle(fontSize: 12,color: Colors.white),),
                        //     SizedBox(width: 30,),
                        //     Icon(Icons.phone,color: Colors.white,size: 17,),
                        //     SizedBox(width: 6,),
                        //     Text("9539846263",style: TextStyle(fontSize: 12,color: Colors.white),)
                        //   ],
                        // )

                      ],
                    ),
                  ),


                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
