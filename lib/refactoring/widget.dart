

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../Providers/mainProvider.dart';
import 'myColor.dart';

Widget cont(String name){
  return Container(
    height: 45,
    width: 320,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: borderColor)

    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name,style: TextStyle(
        color: borderColor,
        fontWeight: FontWeight.w600,

      ),),
    ),

  );
}

Widget height(){
  return SizedBox(height: 30,);
}
Widget height2(){
  return SizedBox(height: 15,);
}

Widget Tf(){

  return Container(
    width: 30,
    decoration: BoxDecoration(
      color: borderColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: TextField(
      keyboardType: TextInputType.phone,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      style: TextStyle(
        color: Colors.black,
      ),

    ),
  );
}

Widget width(){
  return SizedBox(
    width: 20,
  );
}
Widget Tff3(String nmm,TextEditingController cntrlr,String condition){
  return SizedBox(

    width: 140,

    child: TextFormField(
      validator: (v){
        if(v!.isEmpty){
          return condition;
        }else{
          return null;
        }
      },
      controller: cntrlr,
      cursorColor: borderColor,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor)
          ),
          labelText:nmm,labelStyle: TextStyle(
        color: borderColor,
        fontWeight: FontWeight.w400,
      ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: borderColor),

          )

      ),


    ),
  );


}
Widget CCNumberTff(String nmm,TextEditingController cntrlr,String condition){
  return SizedBox(
    width: 140,

    child: TextFormField(
      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (v){
        if(v!.isEmpty){
          return condition;
        }else{
          return null;
        }
      },
      keyboardType: TextInputType.phone,
      controller: cntrlr,
      cursorColor: borderColor,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor)
          ),
          labelText:nmm,labelStyle: TextStyle(
        color: borderColor,
        fontWeight: FontWeight.w400,
      ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: borderColor),
          )

      ),


    ),
  );


}
Widget MNumberTff(String nmm,TextEditingController cntrlr,String condition){
  return SizedBox(

    width: 140,

    child: TextFormField(
      validator: (v){
        if(v!.isEmpty){
          return condition;
        }else{
          return null;
        }
      },
      keyboardType: TextInputType.phone,
      controller: cntrlr,
      cursorColor: borderColor,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor)
          ),
          labelText:nmm,labelStyle: TextStyle(
        color: borderColor,
        fontWeight: FontWeight.w400,
      ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: BorderSide(color: borderColor),
          )

      ),


    ),
  );


}
Widget NameTff(String nmm,TextEditingController cntrl,String condition){
  return SizedBox(
    width: 320,

    child: TextFormField(
      controller: cntrl,
      validator: (v){
        if(v!.isEmpty){
          return condition;
        }
        else{
          return null;
        }
      },
      cursorColor: borderColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor)
          ),
          labelText:nmm,labelStyle: TextStyle(
          color: borderColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: borderColor),

        )

        ),


      ),
  );


}
Widget Tff6(String nmm,TextEditingController cntrl){
  return SizedBox(
    width: 320,

    child: TextFormField(
      controller: cntrl,
      cursorColor: borderColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor)
          ),
          labelText:nmm,labelStyle: TextStyle(
          color: borderColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: borderColor),

        )

        ),


      ),
  );


}
Widget PhoneNumberTff(String nmm,TextEditingController cntrl){
  return SizedBox(
    width: 320,
    child: TextFormField(
      controller: cntrl,
      cursorColor: borderColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor)
          ),
          labelText:nmm,labelStyle: TextStyle(
          color: borderColor,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
          borderSide: BorderSide(color: borderColor),

        )

        ),


      ),
  );


}
Widget PickupLocationTff(TextEditingController cntr,String nmm,dynamic ic,){
  return SizedBox(
    height: 50,
    width: 400,

    child: TextFormField(
      controller: cntr,
      cursorColor: borderColor,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor)
            ),
          prefixIcon: Icon(ic,color: borderColor,),
          labelText:nmm,labelStyle:  TextStyle(
            color: borderColor,
            fontWeight: FontWeight.w400,

          ),
        border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11)
        )

        ),


      ),
  );


}
Widget BrandNameTff(String nmm,dynamic ic,String condition){
  return SizedBox(
    width: 400,

    child: Consumer<MainProvider>(
      builder: (context,val,child) {
        return TextFormField(
          cursorColor: borderColor,
            controller: val.BrandNameController,
            validator: (v){
            if(v!.isEmpty){
              return condition;

            }
            return null;

            },
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor)
                ),
              prefixIcon: Icon(ic,color: borderColor,),
              labelText:nmm,labelStyle:  TextStyle(
                color: borderColor,
                fontWeight: FontWeight.w400,

              ),
            border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11)
            )

            ),


          );
      }
    ),
  );


}
Widget Rtext(String ftxt,String stxt){
  return RichText(text:TextSpan(
  text: ftxt,
  style: TextStyle(fontSize: 22,
  fontWeight: FontWeight.w900,
      color: backColor2,
  ),

  children:  <TextSpan>[
  const TextSpan(
  text:" ",

  ),
  TextSpan(
  text: stxt,
  style:  TextStyle(fontSize: 22,
  fontWeight: FontWeight.w900,
  color: darkwhite,
  )
  ),
  ]

  )
  );
}

Widget head(String txt){
  return Padding(
    padding: EdgeInsets.only(top: 30,left: 20,bottom: 15),
    child: Text(txt,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
Widget head2(String txt){
  return Text(txt,
    style: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget priceW(String txt1,String txt2){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt1,style: TextStyle(
          color: borderColor,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),),
        Text(txt2,style: TextStyle(
          color: borderColor,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),),
      ],
    ),
  );
}
Widget total(String txt1,String txt2){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(txt1,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),),
        Text(txt2,style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
          fontSize: 20,
        ),),
      ],
    ),
  );
}

Widget roww (String txt1,String txt2){
  return Row(
    children: [
      Text(txt1,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
      Text(txt2,style:TextStyle(color: borderColor,fontWeight: FontWeight.bold,fontSize: 18),),


    ],
  );
}
Widget roww2 (String txt1,String txt2){
  return Row(
    children: [
      Text(txt1,style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
      Text(txt2,style:TextStyle(color: borderColor,fontWeight: FontWeight.bold,fontSize: 16),),


    ],
  );
}
