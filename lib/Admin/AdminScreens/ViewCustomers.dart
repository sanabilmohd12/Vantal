import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vantal/Admin/AdminScreens/userFullDetails.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

class ViewCustomer extends StatelessWidget {


  const ViewCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightt=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
           children: [
            Container(
            height: 140,
            width: 400,
            decoration: BoxDecoration(
              border: Border.all(color:borderColor),
              borderRadius: BorderRadius.circular(20),


            ),
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: borderColor,width: 2)
                    ),
                    child: CircleAvatar(
                      radius: 50,

                      backgroundImage: AssetImage("assets/user2.jpeg"),
                      // child:Image.asset("assets/user2.jpeg") ,
                    ),
                  ),
                  // SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      roww2("Name :", "Suhail"),
                      roww2("Phone :", "9539846263"),
                      roww2("Email :", "Shuhail@gmail"),
                    ],
                  ),

                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>userfullDetails()));
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined,color: backColor,size: 32,))
                ],
              ),
            )
            ),

           ],
          ),
        ),
      ),

    );
  }
}


