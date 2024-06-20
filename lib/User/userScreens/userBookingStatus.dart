import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';


class UserViewBooking extends StatelessWidget {


  const UserViewBooking({Key? key}) : super(key: key);

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
                      itemCount: val.BookingStatusList.length,
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
                                        Text(val.BookingStatusList[index].bookingDate,style:TextStyle(color:borderColor,fontWeight: FontWeight.bold),),
                                      ],),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(val.BookingStatusList[index].vName,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              Text(val.BookingStatusList[index].vCompany,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Pick-up Date",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              Text(val.BookingStatusList[index].pickUpDate,style:TextStyle(color:borderColor,fontWeight: FontWeight.bold),),

                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Return Date",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              Text(val.BookingStatusList[index].returnDate,style:TextStyle(color:borderColor,fontWeight: FontWeight.bold),),

                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text("Booking Status : ",style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),),val.BookingStatusList[index].status=="PENDING"?
                                          Text(val.BookingStatusList[index].status,style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),):
                                          val.BookingStatusList[index].status=="CONFIRM"?
                                          Text(val.BookingStatusList[index].status,style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),):
                                          Text(val.BookingStatusList[index].status,style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold
                                          ),)




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


