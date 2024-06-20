import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

class ViewProfile extends StatelessWidget {


  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: blackc,width: 4)
                        ),
                        child: CircleAvatar(backgroundImage: NetworkImage(val.profileImageGet),radius: 65,),
                      );
                    }
                  ),

                  Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10 ),
                        child: Text(val.profileName,style: TextStyle(
                          color: backColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),),
                      );
                    }
                  )
                ],
              ),
            ),
            height(),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return ListTile(
                  leading:Text("Email Id:",style: TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  trailing: Text(val.profileEmail,style: TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),

                );
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return ListTile(
                  leading:Text("Phone Number:",style: TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  trailing: Text(val.profilePhone,style: TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),

                );
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return ListTile(
                  leading:Text("Date of Birth:",style: TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),),
                  trailing:val.profileDob!=null? Text('${DateFormat('dd-MM-yyyy').format(val.profileDob.toDate())}',style: TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),):
                      Text("dd-MM-yyyy"),

                );
              }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            height(),
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 20),
              child: Text("Id Proof",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return Container(
                      height: 180,
                      width: 400,
                      decoration: BoxDecoration(
                        border: Border.all(color:borderColor),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: NetworkImage(val.profileIdPoof),fit: BoxFit.fill),


                      ),

                  );
                }
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentDetails()));
                },
                child: Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black87,
                  ),
                  child: Center(child: Text("Upadte",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),)),
                ),
              ),
            ),
            SizedBox(height: 20,)

          ],
        ),
      ),

    );
  }
}


