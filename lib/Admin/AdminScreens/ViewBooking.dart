import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import 'viewFullDetails.dart';

class ViewBooking extends StatelessWidget {


  const ViewBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Consumer<MainProvider>(
              builder: (context,val,child) {
                return GridView.builder(
                    itemCount: val.BookingList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20,
                  childAspectRatio:2.3,
                  crossAxisCount: 1
                ), itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return Container(
                            height: 160,
                            width: 400,
                            decoration: BoxDecoration(
                              border: Border.all(color:borderColor),
                              borderRadius: BorderRadius.circular(20),


                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(children: [
                                    Text(val.BookingList[index].bookingDate,style:TextStyle(color:borderColor,fontWeight: FontWeight.bold),),
                                  ],),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(val.BookingList[index].vName,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                          Text(val.BookingList[index].vCompany,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Pick-up Date",style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),
                                          Text(val.BookingList[index].pickUpDate,style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold),),

                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Return Date",style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                          Text(val.BookingList[index].returnDate,style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),

                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          val.getCustomerBookingFullData(val.BookingList[index].userId,);
                                          val.getRentalFullData(val.BookingList[index].userId,val.BookingList[index].vehicleId);
                                          print(val.BookingList[index].userId.toString());
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewFullDetails(userId: val.BookingList[index].userId,)));

                                        },
                                        child: const Text("View Full Details",style:

                                        TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          decoration: TextDecoration.underline,
                                        ),),
                                      ),
                                      // Image(image: AssetImage("assets/cars/n.png",),
                                      //   width: 190,
                                      //   height: 85,
                                      // ),

                                      // InkWell(
                                      //   onTap: (){
                                      //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
                                      //   },
                                      //   child: Container(
                                      //     height: 45,
                                      //     width: 80,
                                      //     decoration: BoxDecoration(
                                      //       borderRadius: BorderRadius.circular(15),
                                      //       color: Colors.black87,
                                      //     ),
                                      //     child: const Center(child: Text("Confirm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                                      //   ),
                                      // ),

                                    ],)
                                ],
                              ),
                            )
                        );
                      }
                    ),
                  );

                });
              }
            ),
          ),



        ],
      ),

    );
  }
}


