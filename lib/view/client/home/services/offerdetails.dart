import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/service_provider_account.dart';
import 'package:mtgy_app/view/client/pay&order/cart.dart';

import '../../../../../../controller/client_home_cubit/cubit.dart';
import '../../../../../../controller/client_home_cubit/states.dart';
import '../../../../../../services/widgets/component.dart';
import '../../../../../../services/widgets/constant.dart';
import '../../../../services/widgets/counter.dart';
import '../../pay&order/pay.dart';

class ViewofferDetail extends StatelessWidget {
  const ViewofferDetail({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 10,right: 10),
          child: Container(
            height: 550,
            decoration:const BoxDecoration(
              color: WhiteColor,
              shape: BoxShape.rectangle,
              boxShadow:const [
                BoxShadow(
                  color:  BlueColor,
                  offset: Offset(0,3),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),


              ),
            ),
            child:  Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>  ServicesProviderAccount(),));
                        },
                        child: Text(
                          "Seviceprovider Account Name ",
                          style: GoogleFonts.acme(textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,fontSize: 15,
                              color:BlueColor),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height : 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10),
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,top: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 10,),
                                Text(
                                    "Offer Title",
                                    style: GoogleFonts.acme(textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,fontSize: 23,color: YellowColor,
                                    )),
                                ),
                                const SizedBox(width: 150,),
                                Text(
                                  "Price:",
                                  style: GoogleFonts.acme(textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 23,color: YellowColor,
                                  )),
                                ),
                                Text(
                                  " 130 ",
                                  style: GoogleFonts.aBeeZee(textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 20,color: BlueColor,
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left:30.0,right: 20),
                    child: Text(
                      "Discription Discription Discription xxxxxxxxxxxxxxxxxxx Discription Discription  Discription Discription Discription Discription",
                      style: GoogleFonts.aBeeZee(textStyle:  TextStyle(
                        fontSize: 14,color: BlueColor.withOpacity(0.8),)),
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Center(
                      child: ListTileItem()),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),
                                ),


                                color:  BlueColor),
                            child: ElevatedButton(
                              onPressed: () {
                                      Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>Paymnet()));
                                      },

                              style: ElevatedButton.styleFrom(
                                fixedSize:const Size(350, 45),
                                shadowColor: BlueColor ,
                                elevation: 30,
                                backgroundColor:  BlueColor,

                              ),
                              child:  Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Book now",
                                        style: GoogleFonts.acme(textStyle: const TextStyle(
                                            fontSize: 15,
                                            color: WhiteColor),)),
                                    const SizedBox(width: 5,),
                                    const Icon(Icons.monetization_on,color:YellowColor,size: 17,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Text("OR" ,style: GoogleFonts.acme(textStyle: const TextStyle(
                          fontSize: 15,
                          color: YellowColor),)),
                      const SizedBox(width: 20,),
                      Expanded(
                        child: Center(
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(

                                borderRadius: BorderRadius.circular(5),
                                color:  BlueColor),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)=>CartScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize:const Size(350, 45),
                                shadowColor: BlueColor ,
                                elevation: 30,
                                backgroundColor:  BlueColor,
                              ),
                              child:  Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Add to cart",
                                        style: GoogleFonts.acme(textStyle: const TextStyle(
                                            fontSize: 15,
                                            color: WhiteColor),)),
                                    const SizedBox(width: 5,),
                                    const Icon(Icons.add_shopping_cart_rounded,color:YellowColor ,size: 17,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                    ],
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
