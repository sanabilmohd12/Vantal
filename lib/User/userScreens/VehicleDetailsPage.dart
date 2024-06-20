import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import '../../Providers/mainProvider.dart';
import 'PaymentDeatailsPage.dart';

class DetailPageUser extends StatelessWidget {
  String companyName;
  String vehicleName;
  List<String> vehicleImages;
  String engineSize;
  String transmission;
  String capacity;
  String fuelType;
  String mileage;
  String brandLogo;
  String location;
  String price;
  String vehicleId;
  String deposit;
  String vId;
  String userId;
  DetailPageUser({Key? key,
  required this.companyName,
    required this.vehicleName,
    required this.vehicleImages,
    required this.engineSize,
    required this.transmission,
    required this.capacity,
    required this.fuelType,
    required this.mileage,
    required this.brandLogo,
    required this.location,
    required this.price,
    required this.vehicleId,
    required this.deposit,
    required this.vId,
    required this.userId,

  }) : super(key: key);

  List<String> carImages = [
    "assets/cars/n.png",
    "assets/cars/8.png",
    "assets/cars/y.png",
    "assets/cars/w.png",
  ];
  List<String> icons = [
    "assets/CarIcons/engine.png",
    "assets/CarIcons/gr.png",
    "assets/CarIcons/seat.png",
    "assets/CarIcons/fuel.png",
    "assets/CarIcons/mi.png",
  ];
  List<String> features = [
    "Engine Size",
    "Transmission",
    "Capacity",
    "Fuel Type",
    "Mileage",
  ];
  List<String> dt = [
    "5024 cc",
    "Manual",
    "2 People",
    "Petrol",
    "8 kmpl",
  ];

  @override
  Widget build(BuildContext context) {
    var widthh =MediaQuery.of(context).size.width;
    var heighth =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 34,
          color: blackc,
        ),
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 8),
              child: Rtext(companyName," ${vehicleName}"),
            ),


            Consumer<MainProvider>(
              builder: (context,val,child) {
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    onPageChanged: (index, reason) {
                      val.change(index);
                    },
                    enableInfiniteScroll: false,
                    aspectRatio: 16 / 9,
                    viewportFraction: .9,
                    scrollDirection: Axis.horizontal,
                    scrollPhysics: BouncingScrollPhysics(),
                  ),
                  items: vehicleImages.map((String carImage) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(),
                          child: Image.network(carImage,scale: .5,),
                        );
                      },
                    );
                  }).toList(),
                );
              }
            ),
            SizedBox(height: 2.0), // Adjust the spacing as needed
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: vehicleImages.map((String carImage) {
                int index = vehicleImages.indexOf(carImage);
                return Consumer<MainProvider>(
                  builder: (context,val,child) {
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: val.currentIndex== index ? Colors.white : Colors.grey,
                      ),
                    );
                  }
                );
              }).toList(),
            ),
            height(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    height: heighth / 8,
                    width: widthh / 3.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/CarIcons/engine.png",
                            color: Colors.white,
                            scale: 18,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Engine Size",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                              Text(
                                engineSize+" cc",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Container(
                    height: heighth / 8,
                    width: widthh / 3.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/CarIcons/gr.png",
                            color: Colors.white,
                            scale: 18,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Transmission",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                              Text(
                                transmission,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Container(
                    height: heighth / 7.6,
                    width: widthh / 3.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/CarIcons/seat.png",
                            color: Colors.white,
                            scale: 18,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Seat Capacity",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                              Text(
                                capacity,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Container(
                    height: heighth / 8,
                    width: widthh / 3.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/CarIcons/fuel.png",
                            color: Colors.white,
                            scale: 18,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Fuel Type",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                              Text(
                                fuelType,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Container(
                    height: heighth / 8,
                    width: widthh / 3.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/CarIcons/mi.png",
                            color: Colors.white,
                            scale: 18,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mileage",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                              Text(
                                mileage+" km",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white70),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 120,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white38),
                  borderRadius: BorderRadius.circular(20),


                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(image: NetworkImage(brandLogo),
                            width: 120,
                            height: 50,

                          ),
                          SizedBox(width: 7,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(vehicleName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                              Text(location,style: TextStyle(color: Colors.white70,fontSize: 14),)
                            ],
                          ),


                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle,color: Colors.white,size: 17,),
                          SizedBox(width: 6,),
                          Text("Mon-Sun 8:00-5:30",style: TextStyle(fontSize: 12,color: Colors.white),),
                          SizedBox(width: 30,),
                          Icon(Icons.phone,color: Colors.white,size: 17,),
                          SizedBox(width: 6,),
                          Text("9539846263",style: TextStyle(fontSize: 12,color: Colors.white),)


                        ],
                      )

                    ],
                  ),
                ),


              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(text: TextSpan(
                      text: "${price} Rs",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),
                      children: [
                        TextSpan(
                            text: " /day",
                            style: TextStyle(color: Colors.white70,fontSize: 16)
                        )
                      ]
                  )),
                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails(
                            vehicleName:vehicleName,
                            vehicleImages: vehicleImages,
                            vehicleCompany:companyName ,
                            logo:brandLogo,
                            price: price,
                            deposi: deposit,
                            vId: vId,
                            userId: userId,
                          )));
                        },
                        child: Container(
                          height: 55,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black87,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Rent now",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),),
                              SizedBox(width: 4,),
                              Icon(Icons.arrow_right_alt_outlined,color: Colors.white,),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ],
              ),
            )



          ],
        ),
      ),
    );
  }
}