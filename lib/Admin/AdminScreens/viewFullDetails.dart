import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';
import 'ViewBooking.dart';
class ViewFullDetails extends StatelessWidget {
  String userId;
  ViewFullDetails({Key? key,required this.userId,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
   var heightt=MediaQuery.of(context).size.height;
   var widthh=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Consumer<MainProvider>(
              builder: (context,val,child) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20,top: 8),
                  child: Rtext(val.vCompanyName,val.vName),
                );
              }
            ),


            Consumer<MainProvider>(
              builder: (context,val,child) {
                return Center(child: Image(image: NetworkImage(val.vImage),width: 300,height: 140,));
              }
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 20),
              child: Text("Booking Details :",style: TextStyle(fontSize: 22,
                fontWeight: FontWeight.w900,
                color: backColor2,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height:heightt/2.9,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(color:borderColor),
                  borderRadius: BorderRadius.circular(20),


                ),
                child:Padding(
                  padding:EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 1,),
                            roww("Payment Status :","Paid" ),
                            SizedBox(height: 9,),
                            roww("Total Amount Paid :",val.paidAmount.toString()),
                            SizedBox(height: 9,),
                            roww("No of Days :",val.days.toString()),
                            SizedBox(height: 9,),
                            roww("Pick-Up Location :",val.pickupLocation),
                            SizedBox(height: 9,),
                            roww("Booking Date :",DateFormat('dd-MM-yyyy').format(val.vBookingDate.toDate()) ),
                            SizedBox(height: 9,),
                            roww("Pick-up Date :",DateFormat('dd-MM-yyyy').format(val.vPickUpDate.toDate()) ),
                            SizedBox(height: 9,),
                            roww("Return Date :",DateFormat('dd-MM-yyyy').format(val.vReturnDate.toDate()) ),


                          ],
                        );
                      }
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 20,top: 15),
              child: Text("Customer Details :",style: TextStyle(fontSize: 22,
                fontWeight: FontWeight.w900,
                color: backColor2,
              ),),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  height:heightt/1.48,
                  width: 400,
                  decoration: BoxDecoration(
                    border: Border.all(color:borderColor),
                    borderRadius: BorderRadius.circular(20),


                  ),
                  child:Padding(
                    padding:EdgeInsets.only(top: 20,left: 20,right: 20),
                    child: Consumer<MainProvider>(
                      builder: (context,val,child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
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
                                ),
                                SizedBox(height: 5,),
                                Text(val.vProfileName,style:TextStyle(color:borderColor,fontWeight: FontWeight.bold,fontSize: 18),),
                              ],
                            ),
                            height2(),

                            roww("DOB :",DateFormat('dd-MM-yyyy').format(val.vProfileDob.toDate()) ),
                            SizedBox(height: 9,),
                            Consumer<MainProvider>(
                              builder: (context,val,child) {
                                print(val.profileEmail+"hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                                return roww("Email Id :",val.vProfileEmail );
                              }
                            ),
                            SizedBox(height: 9,),
                            Consumer<MainProvider>(
                              builder: (context,val,child) {
                                return roww("Phone :",val.vProfilePhone );
                              }
                            ),
                            SizedBox(height: 9,),
                            roww("Age :",val.vAge.toString()),
                            SizedBox(height: 9,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Id Proof :",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                SizedBox(height: 9,),
                                Container(
                                  height: heightt/4.8,
                                  width: widthh/1.2,
                                  decoration: BoxDecoration(
                                    border: Border.all(color:borderColor),
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(image: NetworkImage(val.vProfileIdPoof),fit: BoxFit.fill),


                                  ),

                                )
                              ],
                            ),


                          ],
                        );
                      }
                    ),
                  ),
              ),
            ),
            Center(
              child: Padding(
                padding:EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),

                        onPressed: (){
                          provider.rejectBokking(provider.rentalId);
                          callNext(context, ViewBooking());
                        }, child: Text("Cancel",style: TextStyle(
                        color: backColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                    ),)),
                    SizedBox(width: 40,),
                    ElevatedButton(
                        style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                        ),

                        onPressed: (){
                          provider.confirmBokking(provider.rentalId);
                          callNext(context, ViewBooking());
                        }, child: Text("Confirm",style: TextStyle(
                        color: backColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                    ),)),


                  ],
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 15),
            //   child: Center(
            //     child: InkWell(
            //       onTap: (){
            //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
            //       },
            //       child: Container(
            //         height: 55,
            //         width: 100,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(15),
            //           color: Colors.black87,
            //         ),
            //         child: Center(child: Text("ADD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
            //       ),
            //     ),
            //   ),
            // ),

          ],
        ),
      ),

    );
  }
}


