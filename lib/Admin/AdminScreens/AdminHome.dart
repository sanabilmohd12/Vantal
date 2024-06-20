

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Admin/AdminScreens/ViewTest.dart';
import 'package:vantal/User/userScreens/rentalStatus.dart';
import 'package:vantal/User/userScreens/viewProfile.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import '../../Providers/mainProvider.dart';
import '../../User/userScreens/loginPage.dart';
import 'AddVehicle.dart';
import 'ViewBooking.dart';
import 'ViewBrand.dart';
import 'ViewCustomers.dart';
import 'ViewVehicle.dart';
import 'addBrand.dart';


class AdminHomePage extends StatelessWidget {
  AdminHomePage({Key? key}) : super(key: key);

  List<String> carImages = [
    "assets/cars/n.png",
    "assets/cars/8.png",
    "assets/cars/y.png",
    "assets/cars/w.png",
  ];


  @override
  Widget build(BuildContext context) {
    MainProvider provider= Provider.of<MainProvider>(context,listen: false);
    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: borderColor,
      appBar: AppBar(
        backgroundColor: tealColor,
        // leading: Icon(Icons.menu,color: blackc,
        // size: 30,
        // ),
        iconTheme: IconThemeData(color:Colors.white,size: 36 ),
        title: const Text("VANTAL",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        centerTitle:true,
      ),
      drawer: Drawer(
        elevation: 16,
        width: 220,
        backgroundColor: borderColor,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: tealColor,
                ),
                child: Center(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfile()));
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: borderColor,width: 2)
                          ),
                          child: CircleAvatar(
                            radius: 50,

                            backgroundImage: AssetImage("assets/user2.jpeg"),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text("Suhail Pt",style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),


                    ],
                  ),
                )),
            ListTile(
              leading: Icon(Icons.person_add_alt_1_sharp),
              title: Text("Add User Details"),
              onTap: (){
              },

            ),
            ListTile(

              leading: Icon(Icons.crisis_alert_rounded),
              title: Text("Rental Status"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>rentalStatus()));
              },

            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log Out"),
              onTap: (){
                alert(context);

              },

            ),

          ],
        ),
      ),
      body: Column(
        children: [
          Consumer<MainProvider>(
              builder: (context,val,child) {
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      val.change(index);


                    },
                    enableInfiniteScroll: true,
                    aspectRatio: 16 / 9,
                    viewportFraction: .9,
                    scrollDirection: Axis.horizontal,
                    scrollPhysics: BouncingScrollPhysics(),
                  ),
                  items: carImages.map((String carImage) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(),
                          child: Image.asset(carImage,scale: .5,),
                        );
                      },
                    );
                  }).toList(),
                );
              }
          ),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,



                children: [
                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap: (){
                          val.getRentalDetails();
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>ViewBooking()));
                        },
                        child: Card(
                          color: borderColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [tealColor,darkwhite ],
                                begin: Alignment.topRight,
                                end: Alignment.center,

                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: lghtblack,
                                  blurRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(7),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 60,

                                    child: Text(
                                      'View Bookings',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: teal2,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Icon(Icons.feed,color:teal2,size: 35,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(
                        onTap: (){
                          provider.getBrandData();
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewBrand()));

                        },
                        child: Card(
                          color: borderColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [tealColor,darkwhite ],
                                begin: Alignment.topRight,
                                end: Alignment.center,

                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: lghtblack,
                                  blurRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(7),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add Brand',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: teal2,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Icon(Icons.attractions_rounded,color:teal2,size: 40,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                  InkWell(
                    onTap: (){
                      provider.clearVehicle();
                      provider.getBrandData();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Addvehicle(
                        frmId: "New",
                        toId: "",
                      )));
                    },
                    child: Card(
                      color: borderColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [tealColor,darkwhite ],
                            begin: Alignment.topRight,
                            end: Alignment.center,

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: lghtblack,
                              blurRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(7),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Vehicle',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: teal2,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                              SizedBox(height: 6,),
                              Icon(Icons.directions_car_sharp,color:teal2,size: 40,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewCustomer()));
                    },
                    child: Card(
                      color: borderColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [tealColor,darkwhite ],
                            begin: Alignment.topRight,
                            end: Alignment.center,

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: lghtblack,
                              blurRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(7),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                child: Text(
                                  'View Customers',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: teal2,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ),
                              SizedBox(height: 6,),
                              Icon(Icons.person,color:teal2,size: 30,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      provider.changeCarColor();
                      provider.getVehicleData("Car");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewVehicle()));
                    },
                    child: Card(
                      color: borderColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [tealColor,darkwhite ],
                            begin: Alignment.topRight,
                            end: Alignment.center,

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: lghtblack,
                              blurRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(7),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 60,
                                child: Text(
                                  'View Vehicles',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: teal2,
                                    fontWeight: FontWeight.bold,

                                  ),
                                ),
                              ),
                              SizedBox(height: 6,),
                              Icon(Icons.airport_shuttle_sharp,color:teal2,size: 34,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){

                      // callNext(context, TestView());
                    },
                    child: Card(
                      color: borderColor,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [tealColor,darkwhite ],
                            begin: Alignment.topRight,
                            end: Alignment.center,

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: lghtblack,
                              blurRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(7),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Brand',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: teal2,
                                  fontWeight: FontWeight.bold,

                                ),
                              ),
                              SizedBox(height: 6,),
                              Icon(Icons.view_compact_outlined,color:teal2,size: 40,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),




                ],
              ),
            ),
          ),


        ],
      )
    );
  }
  alert(BuildContext context){
    showDialog(context: context, builder: (ctx)=>AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure ?"),
      actions: <Widget>[
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Container(
          height: 40,
          width: 65,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Center(child: Text("No",style: TextStyle(color: backColor),)),
        )),
        TextButton(onPressed: (){
          FirebaseAuth auth=FirebaseAuth.instance;
          auth.signOut();
          print("hellooo");
          // callNextReplacement(context, login());
          //
          //
          // // callNextReplacement(context, login());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => login()),
                (Route<dynamic> route) => false,
          );
        }, child: Container(
          height: 40,
          width: 65,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: teal2,
          ),
          child: Center(child: Text("Yes",style: TextStyle(color: backColor),)),
        )),

      ],

    ));

  }
}
