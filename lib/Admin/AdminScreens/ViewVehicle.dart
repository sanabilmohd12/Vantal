import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Admin/AdminScreens/ViewTest.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';

import '../../refactoring/widget.dart';

class ViewVehicle extends StatelessWidget {
  ViewVehicle({Key? key}) : super(key: key);
  String dropDownvalue2='Perinthalmanna';
  var location = [
    'Perinthalmanna',
    'Elamkulam',
    'Elad',
    'Kunnakkavu',
    'Cherukara',
  ];
  @override
  Widget build(BuildContext context) {
    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Consumer<MainProvider>(
              builder: (context,val,child,) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        val.changeCarColor();
                        val.getVehicleData("Car");

                      },
                      child: Container(
                        height: 45,
                        width: widthh/(2.5),
                        decoration: BoxDecoration(
                            color: val.carColor?teal2: Color(0xffE5E2E2),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(

                                  offset: const Offset(1,3),
                                  color: lghtblack,
                                  blurRadius: 2
                              )
                            ]

                        ),

                        child:  Center(child: Text("Cars",style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: !val.carColor?teal2: Color(0xffE5E2E2)

                        ),)),

                      ),
                    ),
                    InkWell(
                      onTap:(){
                        val.changeMotorColor();
                        val.getVehicleData("Motorcycle");
                      },


                      child: Container(
                        height: 45,
                        width: widthh/(2.5),
                        decoration: BoxDecoration(
                            color:val.motorCycleColor?teal2: Color(0xffE5E2E2),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(

                                  offset: const Offset(1,3),
                                  color: lghtblack,
                                  blurRadius: 2
                              )
                            ]

                        ),

                        child:  Center(child: Text("Motorcycles",style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                          color: !val.motorCycleColor?teal2: Color(0xffE5E2E2)

                        ),)),

                      ),
                    ),
                  ],
                );
              }
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                head2("Location"),
                height2(),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: borderColor,)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), //here include this to get padding
                    child: DropdownButton(
                        borderRadius: BorderRadius.circular(15),
                        dropdownColor: teal2,
                        isExpanded: true,
                        underline: Container(),
                        iconSize: 28,
                        value: dropDownvalue2,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: location.map((String location) {
                          return DropdownMenuItem(
                            value: location,
                            child: Text(location
                              ,style: TextStyle(
                                  color: borderColor,
                                  fontSize: 22
                              ),),
                          );
                        }).toList(),
                        onChanged: (String ?newValue){

                        }),
                  ),
                ),
              ],
            ),
          ),

          Consumer<MainProvider>(
              builder: (context,val,child) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: val.vehicleList.length,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      crossAxisSpacing:10,
                      mainAxisSpacing:10,
                      childAspectRatio: .9,


                    ), itemBuilder: (context, index) {

                    return  Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return GestureDetector(
                          onLongPress: (){
                            showDialog(context: context, builder:(ctx)=>
                                AlertDialog(
                                  backgroundColor: borderColor,
                                  content: const Text("Are you sure!",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:  Color(0xff35103B),
                                    ),),
                                  actions: [
                                    TextButton(onPressed: (){
                                      val.deleteVehicle(val.vehicleList[index].vId,val.vehicleList[index].type);
                                    }, child:Text("Delete",style: TextStyle(
                                      color: Colors.red
                                    ),)),
                                  ],
                                ));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: tealColor,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: borderColor),

                            ),

                            child:   Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 8,left: 8),
                                          child: Text(val.vehicleList[index].company,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8,top: 8),
                                          child: Text(val.vehicleList[index].price,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                        )

                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 8,),
                                          child: Text(val.vehicleList[index].vName,style: TextStyle(color: Colors.white70,),),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 8,),
                                          child: Text("/day",style: TextStyle(color: Colors.white70,),),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                                Container(
                                  height:90,
                                  child: Image.network(val.vehicleList[index].vImages[1],scale: 3,),
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,bottom: 8),
                                      child: Text(val.vehicleList[index].modelYear,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),),
                                    ),
                                    Consumer<MainProvider>(
                                      builder: (context,val,child) {
                                        return InkWell(

                                          onTap: (){
                                           callNext(context, VewVehicledetails(
                                             companyName: val.vehicleList[index].company,
                                             vehicleName: val.vehicleList[index].vName,
                                             vehicleImages: val.vehicleList[index].vImages,
                                             engineSize: val.vehicleList[index].engineSize,
                                             transmission: val.vehicleList[index].transmission,
                                             capacity: val.vehicleList[index].seat,
                                             fuelType: val.vehicleList[index].fType,
                                             mileage: val.vehicleList[index].mileage,
                                             brandLogo: val.vehicleList[index].brandLogo,
                                             location: val.vehicleList[index].location,
                                             price: val.vehicleList[index].price,
                                             vehicleId:val.vehicleList[index].vId,
                                           ));
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 90,
                                            decoration: const BoxDecoration(
                                              color: Colors.black54,
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Text("Full Details",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w900,
                                                  ),),
                                              ),
                                            ),




                                          ),
                                        );
                                      }
                                    )
                                  ],
                                ),

                              ],
                            ),


                          ),
                        );
                      }
                    );



                  },),
                );
              }
          ),

        ],
      ),
    );
  }
}
