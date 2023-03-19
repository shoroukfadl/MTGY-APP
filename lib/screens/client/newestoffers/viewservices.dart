
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/counter.dart';

import '../pay&order/cart.dart';
import '../pay&order/pay.dart';
import '../viewservices/service_provider_account.dart';

class ViewServicesDetail extends StatelessWidget {
  const ViewServicesDetail({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.38,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: WhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: BlueColor,
                              offset: Offset(0, 1),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ]
                      ), //icon inside button,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back, color: YellowColor, size: 20,),
                        onPressed: () {
                            Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(
                height: 700,
                decoration:const BoxDecoration(
                  color: WhiteColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesProviderAccount(),));
                        },
                        child: Container(
                          height: 60,
                          width: 300,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children: [
                              const  Center(
                                    child: Icon(Icons.person_outlined,size: 50,color:  YellowColor
                                      ,),
                                ),
                                const SizedBox(width : 20,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Center(
                                    child: Text(
                                      "Seviceprovider Account Name ",
                                      style: GoogleFonts.acme(textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,fontSize: 15,
                                          color:BlueColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height : 50,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left :40),
                                    child: Text(
                                      "Offer Title",
                                      style: GoogleFonts.actor(textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 25,color: YellowColor,
                                      )),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left :50),
                                        child: Text(
                                          "Location",
                                          style: GoogleFonts.actor(textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,fontSize: 13,
                                              color:BlueColor),
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.location_on,color: YellowColor,size: 15,)
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Price",
                                      style: GoogleFonts.actor(textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 25,color: YellowColor,
                                      )),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "130 ",
                                          style: GoogleFonts.aBeeZee(textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 20,color: BlueColor,
                                          )),
                                        ),
                                        Image.asset( "assets/icons/pound.png",color:  BlueColor,width: 20,height: 15 ,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left:50.0,right: 20),
                            child: Text(
                              "Discription Discription Discription xxxxxxxxxxxxxxxxxxx Discription Discription  Discription Discription Discription Discription",
                              style: GoogleFonts.aBeeZee(textStyle:  TextStyle(
                                fontSize: 14,color: BlueColor.withOpacity(0.8),)),
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const ListTileItem(),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Expanded(
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                    boxShadow:const [
                                      BoxShadow(
                                        color:  BlueColor,
                                        offset: Offset(0,3),
                                        blurRadius: 4.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(5),
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
                                        SizedBox(width: 5,),
                                        Icon(Icons.account_balance_wallet,color:YellowColor,size: 17,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text("OR" ,style: GoogleFonts.acme(textStyle: const TextStyle(
                              fontSize: 15,
                              color: YellowColor),)),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Center(
                              child: Container(
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                    boxShadow:const [
                                      BoxShadow(
                                        color:  BlueColor,
                                        offset: Offset(0,3),
                                        blurRadius: 4.0,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
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
                                        SizedBox(width: 5,),
                                        Icon(Icons.add_shopping_cart_rounded,color:YellowColor ,size: 17,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                        ],
                      ),
                    ],
                  ),
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
