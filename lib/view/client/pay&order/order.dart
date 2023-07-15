
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/client/pay&order/pay.dart';

import '../../../services/widgets/constant.dart';
import '../../../services/widgets/counter.dart';
import '../home/services/viewservices/offers/service_provider_account.dart';
import 'cart.dart';

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
            Container(
              child: SizedBox(
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
                      top: 10,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: WhiteColor.withOpacity(0.7),
                          borderRadius: const BorderRadius.horizontal(
                              right: Radius.circular(15)),
                        ),
                        child: Positioned(
                          top: 10,
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: WhiteColor.withOpacity(0.7),
                              borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(15)),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 20,
                              icon: const Icon(Icons.arrow_back_sharp,color:BlueColor ,),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
                              );
                            },
                              icon:Icon(Icons.person_pin_rounded,size: 70,color:  YellowColor
                                ,),
                            ),
                            const SizedBox(width : 50,),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Text(
                                "SeviceProvider Account Name ",
                                style: GoogleFonts.actor(textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 13,
                                    color:BlueColor),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height : 50,),
                        Column(
                          children: [
                            const SizedBox(height: 20,),
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
                                        Icon(Icons.location_searching,color: YellowColor,size: 15,)
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 400.0),
                                  child:  IconButton(
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CartScreen()
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.shopping_cart_rounded,
                                      color: YellowColor,size: 30,),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.only(left:80.0,right: 20),
                              child: Text(
                                "Discription Discription Discription xxxxxxxxxxxxxxxxxxx Discription Discription  Discription Discription Discription Discription",
                                style: GoogleFonts.actor(textStyle:  TextStyle(
                                  fontSize: 13,color:BlueColor.withOpacity(0.8),)),
                                maxLines: 5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const SizedBox(width: 150,),
                            ListTileItem(),
                            const SizedBox(width: 90,),
                            Column(
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
                                        fontWeight: FontWeight.bold,fontSize: 15,color: BlueColor,
                                      )),
                                    ),
                                    Image.asset( "assets/icons/pound.png",color: BlueColor,width: 20,height: 15 ,)
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Center(
                          child: Container(
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Paymnet()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                fixedSize:const Size(350, 45),
                                shadowColor: BlueColor ,
                                elevation: 30,
                                backgroundColor:  BlueColor,
                              ),
                              child:  Center(
                                child: Text("BOOK NOW",
                                    style: GoogleFonts.actor(textStyle: const TextStyle(
                                        fontSize: 15,
                                        color: YellowColor),)),
                              ),
                            ),
                          ),
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
