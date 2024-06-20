import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/refactoring/myColor.dart';
import 'package:vantal/refactoring/widget.dart';

import '../../Providers/mainProvider.dart';
import 'ViewBrand.dart';

class AddBrand extends StatelessWidget {


  AddBrand({Key? key}) : super(key: key);
  final _fkey=new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _fkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              head('Brand Name'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BrandNameTff("Brand Name", Icons.location_on,"Enter the brand name"),
              ),
              height(),
              Padding(
                padding: const EdgeInsets.only(left: 20,bottom: 20),
                child: Text("Brand Logo",style: TextStyle(
                  color: borderColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Consumer<MainProvider>(
                  builder: (context,val,child) {
                    return InkWell(
                      onTap: (){
                        showBottomSheet(context);

                      },
                      child: val.fileImage!=null?
                          Container(
                              height: 160,
                              width: 400,
                              decoration: BoxDecoration(
                                border: Border.all(color:borderColor),
                                borderRadius: BorderRadius.circular(20),


                              ),

                              child: Image.file(val.fileImage!,width: 140,height: 140,)):
                      Container(
                          height: 160,
                          width: 400,
                          decoration: BoxDecoration(
                            border: Border.all(color:borderColor),
                            borderRadius: BorderRadius.circular(20),


                          ),
                          child:Center(child: Icon(Icons.add_a_photo_outlined,size: 50,color: borderColor,))
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Consumer<MainProvider>(
                    builder: (context,val,child) {
                      return InkWell(
                        onTap: (){
                          if(_fkey.currentState!.validate()){
                            if(val.fileImage!=null){
                              val.addBrand();
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewBrand()));



                            }else {
                             const snackBar= SnackBar(
                                content: Center(child: Text("Please Upload Image",style: TextStyle(color: Colors.red),)),
                                backgroundColor: Colors.white54,
                               shape: StadiumBorder(),
                               behavior: SnackBarBehavior.floating,
                               margin: EdgeInsets.all(100),

                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            }
                          }

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
      ),

    );


  }

}
void showBottomSheet(BuildContext context) {
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
                {provider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: borderColor),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}





