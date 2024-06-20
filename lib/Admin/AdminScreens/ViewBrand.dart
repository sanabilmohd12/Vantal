import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Admin/AdminScreens/test.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import 'AdminHome.dart';
import 'addBrand.dart';

class ViewBrand extends StatelessWidget {
  ViewBrand({Key? key}) : super(key: key);

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
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: borderColor,size: 32,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
          },
        ),
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<MainProvider>(
                builder: (context,value,child) {
                  return SizedBox(
                    height: 400,
                    child:value.LogoList.isNotEmpty? GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.LogoList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onLongPress:(){
                            showDialog(context: context,
                                builder: (ctx)=> AlertDialog(
                                  backgroundColor: Color(0xffD9D9D9),
                                  content:Text("Are you sure want to delete?",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:  Color(0xff35103B),
                                    ),),
                                  actions: [
                                    Consumer<MainProvider>(
                                        builder: (context,value,child) {
                                          return TextButton(onPressed: (){
                                            provider.deleteBrand(value.LogoList[index].id,);


                                          }, child: Text("Delete"));
                                        }
                                    )



                                  ],

                                ));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            height: 120,
                            width: 140,
                            decoration: BoxDecoration(
                                color: backColor2,
                                borderRadius:BorderRadius.circular(15) ,
                                image: DecorationImage(image: NetworkImage(value.LogoList[index].Logo),scale: 12),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(2,4),
                                      color: lghtblack,
                                      blurRadius: 2
                                  )
                                ]

                            ),
                          ),
                        );

                      },):Text("Empty..."),
                  );
                }
            ),

            height(),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: InkWell(
                  onTap: (){
                    provider.clearBrand();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBrand()));
                  },
                  child: Container(
                    height: 55,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black87,
                    ),
                    child: Center(child: Icon(Icons.add,color: Colors.white,size: 32),)),
                  ),
                ),
              ),

          ],
        ),
      ),
      
      
    );
  }
}
