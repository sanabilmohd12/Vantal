import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import this for date formatting
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';
import 'bookingStatus.dart';

class PaymentDetails extends StatelessWidget {
  String vehicleName;
  List<String> vehicleImages;
  String vehicleCompany;
  String logo;
  String price;
  String deposi;
  String vId;
  String userId;
   PaymentDetails({Key? key,
     required this.vehicleName,
     required this.vehicleImages,
     required this.vehicleCompany,
     required this.logo,
     required this.price,
     required this.deposi,
     required this.vId,
     required this.userId,
   }) : super(key: key);
  @override
  // void initState() {
  //   super.initState();
  //   // Set initial values for fromDate and toDate
  //   fromDate = DateTime.now().subtract(Duration(days: 7));
  //   toDate = DateTime.now();
  // }

  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    var rentalTotal=provider.difference;
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
        iconTheme: IconThemeData(
          size: 34,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            head('Select Date'),
            // Date range selection
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return Container(
                    height: 120,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(20),


                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              Icon(Icons.date_range_outlined,color: backColor,size: 28,),
                              SizedBox(width: 10,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("From",style: TextStyle(
                                    color: borderColor,
                                  ),),
                                  InkWell(
                                    onTap: (){
                                      provider.selectFromDate(context);
                                    },
                                    child: Text('${DateFormat('yyyy-MM-dd').format(val.fromDate)}',style: TextStyle(
                                      color: backColor,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 18
                                    ),),
                                  ),
                                  Text(
                                    '${DateFormat('EEEE').format(val.fromDate)}',
                                    style: TextStyle(
                                      color: backColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.arrow_forward,color: backColor,size: 38,),
                          Row(
                            children: [
                              Icon(Icons.date_range_outlined,color: backColor,size: 28,),
                              SizedBox(width: 10,),
                              Column(
                                children: [
                                  Text("To",style: TextStyle(
                                    color: borderColor,
                                  ),),
                                  Builder(
                                    builder: (context) {
                                      return Row(
                                        children: [

                                          InkWell(
                                            onTap: (){
                                              provider.selectToDate(context,price,deposi);
                                            },
                                            child: Text('${DateFormat('yyyy-MM-dd').format(val.toDate)}',style: TextStyle(
                                              color: backColor,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18
                                            ),),
                                          ),

                                        ],
                                      );
                                    }
                                  ),
                                  Text(
                                    '${DateFormat('EEEE').format(val.toDate)}',
                                    style: TextStyle(
                                      color: backColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
            head('Pick-up location'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return PickupLocationTff(val.locationPickup,"Pick-up locatio", Icons.location_on,);
                }
              ),
            ),
            head('Payment'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image(image:AssetImage("assets/icon _Card_.png") ),
                          SizedBox(width: 10,),
                          Text("xxxx xxxx xxxx 4565",style: TextStyle(
                            color: backColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,

                          ),),
                        ],
                      ),

                      Text("Change",style: TextStyle(color: blackc,
                        fontWeight: FontWeight.w700,
                      ),)

                    ],
                  ),
                ),
              ),
            ),
            head('Car rental fee'),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 100,
                width: 400,
                decoration: BoxDecoration(
                  border:Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Image(image: NetworkImage(vehicleImages[1]),
                    width: 170,
                      height: 100,
                    ),
                    SizedBox(width: 20,),
                    Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(vehicleName,style: TextStyle(
                              color: backColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                            ),),
                            SizedBox(height: 5,),
                            Text("${price}/day x ${val.difference}",style: TextStyle(
                                color: borderColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 16
                            ),),

                          ],
                        );
                      }
                    )
                  ],
                ),
              ),
            ),
            head("Price Details"),

            Consumer<MainProvider>(
              builder: (context,val,child) {
                return Column(
                  children: [

                    priceW("Car rental fee", "${val.rentalFee.toString()}Rs"),
                    priceW("Deposit", "${double.parse(deposi)}Rs"),
                    priceW("Delivery Charge", "500.0Rs"),
                    total("Total Amount", "${val.totalPrice.toString()}Rs")

                  ],
                );
              }
            ),
            SizedBox(height: 65,)




          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 110,
        child: Consumer<MainProvider>(
          builder: (context,val,child) {
            return FloatingActionButton(
              backgroundColor: blackc,
              onPressed:(){
                val.addRentalDetails(vehicleImages[1], vehicleName, vId,userId,vehicleCompany);
                showDialog(context: context,
                    builder: (ctx)=>AlertDialog(

                      backgroundColor: Colors.white70,

                      title: Center(child: Column(
                        children: [
                          Text("Booking Confirmed",style: TextStyle(

                            fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(height: 20,),
                          Image(image: AssetImage("assets/ss2.png"),
                            width: 140,
                            height: 140,
                          ),
                        ],
                      )),

                      shadowColor: tealColor,

                      actions: <Widget>[
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>StatusPage(
                            vImage: vehicleImages[1],
                            vCompany: vehicleCompany,
                            vName: vehicleName,
                            logo: logo,
                            pickUpDate: DateFormat("dd/MM/yyyy").format(provider.fromDate).toString(),
                            endDate: DateFormat("dd/MM/yyyy").format(provider.toDate).toString(),
                          )));
                        }, child: Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                              color:blackc,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text("OK",style: TextStyle(color: Colors.white),))))
                      ],
                    ));

              },
              child: Text("Pay Now",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),),



            );
          }
        ),
      ),
    );
  }
}