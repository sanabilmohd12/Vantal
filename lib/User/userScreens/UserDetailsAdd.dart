import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/User/userScreens/homePage.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

class UserDetailsAdd extends StatelessWidget {
  String userId;
  String uName;
  String uEmail;
  String uPhone;
  UserDetailsAdd({Key? key,
    required this.userId,
    required this.uName,
    required this.uEmail,
    required this.uPhone,
  }) : super(key: key);

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
                      return InkWell(
                        onTap:(){
                          showBottomSheet(context,"id");
                          },
                        child:val.vProfileImageGet.isNotEmpty && val.profileImage==null?
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: blackc,width: 4)
                          ),
                          child: CircleAvatar(backgroundImage: NetworkImage(val.vProfileImageGet!) ,radius: 65,),
                        )
                            :val.vProfileImageGet.isEmpty && val.profileImage==null?
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: blackc,width: 4)
                          ),
                          child: CircleAvatar(child: Icon(Icons.person_add_alt_1_sharp,color:Colors.grey,size: 50,),radius: 65,),
                        ):val.vProfileImageGet.isNotEmpty && val.profileImage!=null?
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: blackc,width: 4)
                          ),
                          child: CircleAvatar(backgroundImage:FileImage(val.profileImage!) ,radius: 65,),
                        ):Container(),
                      );
                    }
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10 ),
                    child: Text(uName,style: TextStyle(
                      color: backColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),),
                  )
                ],
              ),
            ),
            height(),
            ListTile(
              leading:Text("Email Id:",style: TextStyle(
              color: borderColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
               ),),
              trailing: Text(uEmail,style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),

            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            ListTile(
              leading:Text("Phone Number:",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
              trailing: Text(uPhone,style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),

            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(color: borderColor,thickness: 1,),
            ),
            ListTile(
              leading:Text("Date of Birth:",style: TextStyle(
                color: borderColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
              trailing: Consumer<MainProvider>(
                builder: (context,val,child) {
                  return InkWell(
                    onTap: (){
                      val.selectDateOfBirth(context);
                    },
                    child: Text('${DateFormat('yyyy-MM-dd').format(val.dob)}',style: TextStyle(
                      color: borderColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                  );
                }
              ),

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
            Consumer<MainProvider>(
              builder: (context,val,child) {
                return InkWell(
                  onTap: (){
                    showBottomSheet(context,"");
                  },
                  child:val.vProfileIdPoof.isNotEmpty?
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                        height: 160,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(color:borderColor),
                          borderRadius: BorderRadius.circular(20),


                        ),
                        child:Image(image: NetworkImage(val.vProfileIdPoof!),)
                    ),
                  ):
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                                height: 160,
                                width: 400,
                          decoration: BoxDecoration(
                          border: Border.all(color:borderColor),
                          borderRadius: BorderRadius.circular(20),


    ),
    child:Center(child: Icon(Icons.add_a_photo_outlined,size: 50,color: borderColor,))
                    ),
                  ),
                );
              }
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Consumer<MainProvider>(
                  builder: (context,val,child) {
                    return InkWell(
                      onTap: (){
                        val.addProfile(userId, uName, uEmail, uPhone);
                        val.getCustomerBookingFullData(userId);
                        callNext(context, homePage(userId: userId, uName: uName, uEmaild: uEmail, uPhone: uPhone));

                      },
                      child: Container(
                        height: 55,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black87,
                        ),
                        child: Center(child: Text("ADD",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                      ),
                    );
                  }
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

void showBottomSheet(BuildContext context,String FrmId) {
  MainProvider provider = Provider.of<MainProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: borderColor,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getProfileCamera(FrmId), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: borderColor),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getProfileGallery(FrmId), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}


