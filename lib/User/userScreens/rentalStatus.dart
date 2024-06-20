import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

class rentalStatus extends StatelessWidget {


  const rentalStatus({Key? key}) : super(key: key);

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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
                height: 145,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color:borderColor),
                  borderRadius: BorderRadius.circular(20),


                ),
                child:const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10,left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Audi",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Text("RB Coupe",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Return Date",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Text("25/05/2023",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: AssetImage("assets/cars/n.png",),
                        width: 180,
                          height: 80,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text("Rental Started",style:TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),),
                        ),

                    ],)
                  ],
                )
            ),
          ),

        ],
      ),

    );
  }
}


