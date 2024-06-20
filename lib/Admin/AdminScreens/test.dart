

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../Providers/mainProvider.dart';
import '../../refactoring/myColor.dart';
import '../../refactoring/widget.dart';
import 'AdminHome.dart';

// ... (your existing imports)

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  // XFile? _image;
  //
  // Future<void> _pickImage() async {
  //   final ImagePicker _picker = ImagePicker();
  //   final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
  //
  //   setState(() {
  //     _image = pickedImage;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
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
        child:  Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                  crossAxisSpacing:10,
                  mainAxisSpacing:10,
                  childAspectRatio: .9,


                ), itemBuilder: (context, index) {

                return  Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // image:DecorationImage(
                        //         image: AssetImage(Carimage[index],),
                        // ),
                          color: tealColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(


                              offset: Offset(0,5),
                              blurRadius: 3,
                              color: Colors.grey,

                            )
                          ]



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
                                    // child: Text(Company[index],style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 8,top: 8),
                                    child: Text("5678",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                  )

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8,),
                                    // child: Text(name[index],style: TextStyle(color: Colors.white70,),),
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
                            // child: Image.asset(Carimage[index],scale: 4,),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,

                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 8,bottom: 8),
                                child: Text("Model",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),),
                              ),
                              InkWell(

                                // onTap: (){
                                //   Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                                // },
                                child: Container(
                                  // height: 39,
                                  // width: 105,
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
                              )
                            ],
                          ),

                        ],
                      ),


                    ),
                  ],
                );



              },),
            ),

          ],
        ),
      ),


    );
  }
}


