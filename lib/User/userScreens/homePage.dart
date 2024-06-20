

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/User/userScreens/rentalStatus.dart';
import 'package:vantal/User/userScreens/userBookingStatus.dart';
import 'package:vantal/User/userScreens/viewProfile.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import 'UserDetailsAdd.dart';
import 'VehicleDetailsPage.dart';
import 'ViewAll.dart';
import 'bookingStatus.dart';
import 'loginPage.dart';

class homePage extends StatelessWidget {
  String userId;
  String uName;
  String uEmaild;
  String uPhone;
   homePage({Key? key,
     required this.userId,
     required this.uName,
     required this.uEmaild,
     required this.uPhone,
   }) : super(key: key);

   List<String> carImages = [
     "assets/cars/n.png",
     "assets/cars/bike.png",
     "assets/cars/8.png",
     // "assets/cars/bk3.png",
     "assets/cars/y.png",
     "assets/cars/w.png",
     "assets/cars/bk2.png",
   ];

  List<String> Carimage=[
    "assets/cars/m.png",
    "assets/cars/n.png",
    "assets/cars/b.png",
    "assets/cars/8.png",
    "assets/cars/y.png",
    "assets/cars/w.png",
    "assets/cars/op.png",
    "assets/cars/l.png",
    "assets/cars/r.png",
    "assets/cars/8.png",
    "assets/cars/m.png",
    "assets/cars/n.png",
  ];
  List<String> CarLogo=[
    "assets/CarLogo/mini.png",
    "assets/CarLogo/kia.png",
    "assets/CarLogo/Land.png",
    "assets/CarLogo/audi.png",
    "assets/CarLogo/bmw.png",
    "assets/CarLogo/hon.png",
    "assets/CarLogo/hun.png",
    "assets/CarLogo/merc.png",
  ];


  @override
  Widget build(BuildContext context) {
    String dropDownvalue='Perinthalmanna';
    var location = [
      'Perinthalmanna',
      'Elamkulam',
      'Elad',
      'Kunnakkavu',
      'Cherukara',
    ];
    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: borderColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white,size: 36),
        backgroundColor: tealColor,
        // actions: [
        //   InkWell(
        //     onTap: (){
        //       FirebaseAuth auth=FirebaseAuth.instance;
        //       auth.signOut();
        //       callNextReplacement(context, login());
        //
        //     }
        //       ,
        //       child: Icon(Icons.power_settings_new_sharp))],

        // leading: Icon(Icons.menu,color: blackc,
        // size: 30,
        // ),
        title: const Text("VANTAL",
        
        
        

        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: Colors.white,
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
                  child: Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return Column(
                        children: [
                          Consumer<MainProvider>(
                            builder: (context,val,child) {
                              return InkWell(
                                onTap: (){
                                  // val.getProfileData(userId);
                                  val.getCustomerBookingFullData(userId);
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetailsAdd(
                                    userId: userId,
                                    uName: uName,
                                    uEmail: uEmaild,
                                    uPhone: uPhone,)));
                                },
                                child:val.vProfileImageGet.isNotEmpty?
                              Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: borderColor,width: 2)
                                  ),
                                  child: CircleAvatar(
                                    radius: 50,

                                    backgroundImage: NetworkImage(val.vProfileImageGet),
                                    // child:Image.asset("assets/user2.jpeg") ,
                                  ),
                                ):
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: borderColor,width: 2)
                                  ),
                                  child: CircleAvatar(
                                    radius: 50,

                                   child: Icon(Icons.person_add_alt_1_sharp,color:Colors.grey,size: 45,),
                                    // child:Image.asset("assets/user2.jpeg") ,
                                  ),
                                )
                              );
                            }
                          ),
                          SizedBox(height: 10,),
                          Text(uName,style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),


                        ],
                      );
                    }
                  ),
                )),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return ListTile(
                  leading: Icon(Icons.person_add_alt_1_sharp),
                  title: Text("Profile"),
                  onTap: (){
                    val.getProfileData(userId);
                    print(val.profileIdPoof+"jjjjjjjjjjjjjjjjjjjjjj");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProfile()));
                  },

                );
              }
            ),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return ListTile(

                  leading: Icon(Icons.crisis_alert_rounded),
                  title: Text("Rental Status"),
                  onTap: ()
                  {
                    val.getRentalStatusDetails(userId);
                   callNext(context, UserViewBooking());
                  },

                );
              }
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notificaton"),
              onTap: (){
                callNext(context, rentalStatus());
              },

            ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text("Profile"),
            //   onTap: (){},
            //
            // ),
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
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height(),
            Center(
              child: Container(
                height: 55,
                width: 380,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextFormField(
                  cursorColor: borderColor,
                  decoration: InputDecoration(
                    focusedBorder:OutlineInputBorder(
                        borderSide: BorderSide(color: borderColor),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search Vehicle",hintStyle: const TextStyle(
                    fontSize: 14,

                  ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: BorderSide(color: Colors.black54),
                    ),

                ),
              ),
            ),
            ),
            height(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap: (){
                          val.changeCarColor();
                          val.getVehicleData("Car");
                        },
                        child: Container(
                          height: 45,
                          width: widthh/(2.5),
                          decoration: BoxDecoration(
                            color: val.carColor?tealColor:Color(0xffE5E2E2),
                            borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(

                                  offset: const Offset(1,3),
                                  color: lghtblack,
                                  blurRadius: 2
                                )
                              ]

                          ),

                          child: Center(child: Text("Cars",style: TextStyle(
                            color: !val.carColor?tealColor:Color(0xffE5E2E2),
                            fontWeight: FontWeight.w900,
                            fontSize: 18,

                          ),)),

                        ),
                      );
                    }
                  ),
                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap: (){
                          val.changeMotorColor();
                          val.getVehicleData("Motorcycle");
                        },
                        child: Container(
                          height: 45,
                          width: widthh/(2.5),
                          decoration: BoxDecoration(
                            color: val.motorCycleColor?tealColor:Color(0xffE5E2E2),
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
                            color: !val.motorCycleColor?tealColor:Color(0xffE5E2E2),
                            fontWeight: FontWeight.w900,
                            fontSize: 18,

                          ),)),

                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20 , top: 20),
            //   child: Text("Location"
            //     ,style: TextStyle(
            //       color: lghtblack,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20),
            //   child: DropdownButton(
            //       value: dropDownvalue,
            //       icon: const Icon(Icons.keyboard_arrow_down),
            //       items: location.map((String location) {
            //         return DropdownMenuItem(
            //           value: location,
            //           child: Text(location),
            //         );
            //       }).toList(),
            //       onChanged: (String ?newValue){
            //
            //       }),
            // ),
            height(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text:TextSpan(
                    text: "Most",
                    style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: blackc,
                    ),

                    children: const <TextSpan>[
                      TextSpan(
                        text: "  Popular",
                        style: TextStyle(fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.black38,
                      )
                      )
                    ]


                  ),

                  ),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewAll()));

                    },
                    child: Text("View all",style:
                      TextStyle(
                        color: tealColor
                      ),),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 250,
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return ListView.builder(
                    itemCount: val.vehicleList.length,
                      padding: EdgeInsets.only(left: 20),
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (context,index)
                  {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(

                        children: [

                          Container(
                            height: 230,
                            width: 200,
                            decoration: BoxDecoration(
                                color: tealColor,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(image: NetworkImage(val.vehicleList[index].vImages[1]),scale: .5),
                                boxShadow: [
                                  BoxShadow(


                                      offset: const Offset(2,4),
                                      color: lghtblack,
                                      blurRadius: 2
                                  )
                                ]


                            ),
                            child: Column(
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
                                          padding: EdgeInsets.only(right: 8,top: 8),
                                          child: Text(val.vehicleList[index].price,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
                                        Padding(
                                          padding: EdgeInsets.only(right: 8,),
                                          child: Text("/day",style: TextStyle(color: Colors.white70,),),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,bottom: 8),
                                      child: Text(val.vehicleList[index].modelYear,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                    ),
                                    InkWell(
                                      onTap:(){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPageUser(
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
                                          deposit: val.vehicleList[index].deposit,
                                          vId: val.vehicleList[index].vId,
                                          userId: userId,
                                        )));
                                              },
                                      child: Container(
                                        height: 39,
                                        width: 95,
                                        decoration: const BoxDecoration(
                                          color: Colors.black87,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text("Rent now",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w900,
                                                ),),
                                              SizedBox(width: 2,),
                                              Icon(Icons.arrow_right_alt_outlined,color: Colors.white,),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),

                          ),
                        ],
                      ),
                    );


                  }
                  );
                }
              ),
            ),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              RichText(text:TextSpan(
              text: "Top",
                  style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: blackc,
                  ),

                  children: const <TextSpan>[
                    TextSpan(
                        text: "  Brands",
                        style: TextStyle(fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Colors.black38,
                        )
                    )
    ]
              ),
              )


                ],
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 150,
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: val.LogoList.length,

                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          height: 120,
                          width: 140,
                          decoration: BoxDecoration(
                            color: backColor2,
                              borderRadius:BorderRadius.circular(15) ,
                              image: DecorationImage(image: NetworkImage(val.LogoList[index].Logo,),scale: 12),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(2,4),
                                    color: lghtblack,
                                    blurRadius: 2
                                )
                              ]

                          ),
                        );
                      }

                  );
                }
              ),
            ),
            Consumer<MainProvider>(
                builder: (context,val,child) {
                  return CarouselSlider(
                    options: CarouselOptions(
                      height: 130,
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
                            child: Image.asset(carImage,scale: 3,),
                          );
                        },
                      );
                    }).toList(),
                  );
                }
            ),

          ],
        ),
      ),
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

