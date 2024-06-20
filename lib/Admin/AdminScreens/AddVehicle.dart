import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vantal/Admin/AdminScreens/AdminHome.dart';
import 'package:vantal/Providers/mainProvider.dart';
import 'package:vantal/refactoring/callFunctions.dart';
import 'package:vantal/refactoring/myColor.dart';

import '../../modelClass/ModelClass.dart';
import '../../refactoring/widget.dart';

class Addvehicle extends StatelessWidget {
  String frmId;
  String toId;
  Addvehicle({Key? key ,required this.frmId,required this.toId}) : super(key: key);
  final _fkey= new GlobalKey<FormState>();

  var vehicle = [
    "Car",
    "Motorcycle"
  ];
  var location = [
    'Perinthalmanna',
    'Elamkulam',
    'Elad',
    'Kunnakkavu',
    'Cherukara',
  ];

  @override
  Widget build(BuildContext context) {
    MainProvider provider=Provider.of<MainProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: tealColor,
      appBar: AppBar(
        backgroundColor: tealColor,
      ),
      body: SingleChildScrollView(
        child: Consumer<MainProvider>(
          builder: (context,val,child) {
            return Form(
              key: _fkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: borderColor,)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),

                      child: Consumer<MainProvider>(
                        builder: (context,val,child) {
                          return DropdownButton(
                            underline: Container(),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(15),
                              dropdownColor: teal2,
                              iconSize: 28,
                              value: val.dropDownvalue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: vehicle.map((String vehicle) {
                                return DropdownMenuItem(
                                  value: vehicle,
                                  child: Text(vehicle,style: TextStyle(
                                    color: borderColor,
                                    fontSize: 22
                                  ),),
                                );
                              }).toList(),
                              onChanged: (String ?newValue){
                              val.dropDownType(newValue);

                              });
                        }
                      ),
                    ),
                  ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: head2('Vehicle Name'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: NameTff("",val.Vnameconroller,"Enter Vehicle Name"),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            head2("Company"),
                            SizedBox(height: 15,),
                            SizedBox(

                              width: 180,
                              child: Consumer<MainProvider>(
                                  builder: (context,value,child) {
                                    return Autocomplete<Brand>(
                                      optionsBuilder:
                                          (TextEditingValue textEditingValue) {
                                        return value.LogoList.where((Brand item) => item.BrandName.toLowerCase()
                                            .contains(textEditingValue.text
                                            .toLowerCase()))
                                            .toList();
                                      },
                                      displayStringForOption: (Brand option) =>
                                      option.BrandName,
                                      fieldViewBuilder: (BuildContext context,
                                          TextEditingController
                                          fieldTextEditingController,
                                          FocusNode fieldFocusNode,
                                          VoidCallback onFieldSubmitted) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          fieldTextEditingController.text = value.companyController.text;
                                        });

                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            child: TextFormField(
                                              cursorColor: borderColor,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w200),
                                              decoration: InputDecoration(
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(color: borderColor)
                                                ),
                                                hintText:"Brand",
                                                hintStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w200,
                                                    fontFamily: 'PoetsenOne'),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10),
                                                ),
                                              ),
                                              onChanged: (txt) {},
                                              controller: fieldTextEditingController,
                                              focusNode: fieldFocusNode,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "This field is Required";
                                                } else {}
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      onSelected: (Brand selection) {
                                        value.brandLogo=selection.Logo;
                                        value.companyController.text = selection.BrandName;
                                        print(selection.id + "asdfg");
                                      },
                                      optionsViewBuilder: (BuildContext context,
                                          AutocompleteOnSelected<Brand> onSelected,
                                          Iterable<Brand> options) {
                                        return Align(
                                          alignment: Alignment.topLeft,
                                          child: Material(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:teal2,
                                                borderRadius: BorderRadius.circular(15)
                                              ),
                                              width: 200,
                                              height: 200,
                                              child: ListView.builder(
                                                padding: const EdgeInsets.all(10.0),
                                                itemCount: options.length,
                                                itemBuilder:
                                                    (BuildContext context, int index) {
                                                  final Brand option =
                                                  options.elementAt(index);

                                                  return GestureDetector(
                                                    onTap: () {
                                                      onSelected(option);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            color:teal2,
                                                            borderRadius: BorderRadius.circular(8),
                                                            // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                                            // ))
                                                          ),
                                                          height: 30,
                                                          width: 200,
                                                          child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Center(
                                                                  child: Text(option.BrandName,
                                                                      style: const TextStyle(
                                                                        fontFamily:
                                                                        'PoetsenOne',
                                                                        color: Colors.white,
                                                                      )),
                                                                ),
                                                              ]

                                                          ),
                                                        ),
                                                        Divider(
                                                          thickness: 1,
                                                          color: borderColor,
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),

                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }
                              ),
                            ),
                            // Tff3("",val.CompanyController)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Engine Size"),
                            SizedBox(height: 15,),
                            CCNumberTff("",val.EngineController,"Enter Engine Size")
                          ],
                        ),
                      ],
                    ),
                  ),
                  height2(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Transmission"),
                            SizedBox(height: 15,),
                            Tff3("",val.TransmissionController,"Enter the Transmission")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Seat"),
                            SizedBox(height: 15,),
                            Tff3("",val.SeatController,"Enter the Seat capacity")
                          ],
                        ),
                      ],
                    ),
                  ),
                  height2(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Fuel Type"),
                            SizedBox(height: 15,),
                            Tff3("",val.FuelController,"Give Fuel type")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Mileage"),
                            SizedBox(height: 15,),
                            MNumberTff("",val.MileageController,"Give Mileage")
                          ],
                        ),
                      ],
                    ),

                  ),
                  height2(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Model Year"),
                            SizedBox(height: 15,),
                            MNumberTff("",val.ModelController,"Give Model Year")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Price/Day"),
                            SizedBox(height: 15,),
                            MNumberTff("",val.PriceController,"Give Rent Price")
                          ],
                        ),
                      ],
                    ),
                  ),
                  height2(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            head2("Deposit"),
                            SizedBox(height: 15,),
                            MNumberTff("",val.depositController,"Give the deposit")
                          ],
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     head2("Price/Day"),
                        //     SizedBox(height: 15,),
                        //     MNumberTff("",val.PriceController,"Give Mileage")
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  height2(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        head2("Location"),
                        height2(),
                        Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: borderColor,)),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0), //here include this to get padding
                          child: Consumer<MainProvider>(
                            builder: (context,val,child) {
                              return DropdownButton(
                                  borderRadius: BorderRadius.circular(15),
                                  dropdownColor: teal2,
                                  isExpanded: true,
                                  underline: Container(),
                                  iconSize: 28,
                                  value: val.dropDownvalue2,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: location.map((String location) {
                                    return DropdownMenuItem(
                                      value: location,
                                      child: Text(location
                                        ,style: TextStyle(
                                          color: borderColor,
                                          fontSize: 22
                                      ),),
                                    );
                                  }).toList(),
                                  onChanged: (String ?newValue){
                                    val.dropDownLocation(newValue);
                                  });
                            }
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                  height2(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 20),
                    child: head2("Vehicle Image")
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Consumer<MainProvider>(
                          builder: (context,val,child) {
                            print(val.vehicleImageList.length.toString()+"xhxggc");
                            return InkWell(
                              onTap: (){

                              },
                              child:val.vehicleImageList.isNotEmpty?

                                  Container(
                                    height: 180,
                                    width: 300,
                                    color: tealColor,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: val.vehicleImageList.length,
                                        itemBuilder: (context,indexx){
                                      return Container(
                                        height: 120,
                                        width: 150,
                                        padding: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: borderColor),
                                          borderRadius: BorderRadius.circular(12),
                                          color:tealColor,
                                          // image: DecorationImage(image:FileImage(val.vehicleImageList[indexx]) )
                                        ),
                                        child: Image.file(val.vehicleImageList[indexx],scale: 10,),

                                      );
                                    },
                                    ),
                                  )
                                  :val.vehicleImagesUpdate.isNotEmpty?

                              Container(
                                height: 190,
                                width: 250,
                                color: tealColor,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: val.vehicleImagesUpdate.length,
                                    itemBuilder: (context,indexx){
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 5),
                                        child: InkWell(
                                          onTap: (){
                                            val.getvehicleImagegallery();
                                          },
                                          child: Container(
                                            height: 80,
                                            padding: EdgeInsets.only(right: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(color: borderColor),
                                              borderRadius: BorderRadius.circular(12),
                                              color:tealColor,
                                              // image: DecorationImage(image:FileImage(val.vehicleImageList[indexx]) )
                                            ),
                                            child: Image.network(val.vehicleImagesUpdate[indexx]),
                                          ),
                                        ),
                                      );
                                    }),

                              ):
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Container(
                                    height: 160,
                                    width: 300,
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
                        SizedBox(width: 10,),
                        // val.vehicleImageList.length>=1||val.vehicleImagesUpdate.length>=1?
                        InkWell(
                          onTap: (){
                            val.getvehicleImagegallery();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: blackc,
                              borderRadius: BorderRadius.circular(15),
                            ),

                            child: Icon(Icons.add,color: borderColor,),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          if(_fkey.currentState!.validate()) {
                            if(val.vehicleImageList.isNotEmpty||val.vehicleImagesUpdate.isNotEmpty) {
                              if(val.vehicleImageList.length>=3||val.vehicleImagesUpdate.length>=3){
                                if(frmId=="New") {
                                  val.AddVehicle(context,"New"," ");
                                }
                                else
                                {
                                  val.AddVehicle(context, "Edit", toId);
                                }
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text("Upload minimum 3 Images",
                                  style: TextStyle(color: Colors.red),
                                )),
                                  backgroundColor: Colors.white54,
                                  shape: StadiumBorder(),
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.all(100),
                                ));

                              }

                            }
                            else {
                              const snackBar= SnackBar(
                                content: Center(child: Text("Please Upload Image",style: TextStyle(color: Colors.red),)),
                                backgroundColor: Colors.white54,
                                shape: StadiumBorder(),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(100),

                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                            }
                            // else{
                            //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please Upload Image",
                            //     style: TextStyle(color: Colors.red)),
                            //     backgroundColor: Colors.white54,
                            //     shape: StadiumBorder(),
                            //     behavior: SnackBarBehavior.floating,
                            //     margin: EdgeInsets.all(100),
                            //
                            //   ));
                            // }
                          }
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));
                        },
                        child: Container(
                          height: 55,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black87,
                          ),
                          child: Center(child: Text("Save",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
