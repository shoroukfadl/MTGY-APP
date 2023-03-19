// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/counter.dart';


class ViewOffers extends StatelessWidget {
  const ViewOffers({
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
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 35,
                      height: 45,
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
                           Container(
                            height: 60,
                            width: 300,
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: BlueColor,
                                    width: 2,
                                  )
                              ),
                            ),
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
                                        style: GoogleFonts.actor(textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 13,
                                            color:BlueColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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

                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:90.0),
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
                                              fontWeight: FontWeight.bold,fontSize: 15,color: BlueColor,
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
                                style: GoogleFonts.actor(textStyle:  TextStyle(
                                  fontSize: 13,color: BlueColor.withOpacity(0.8),)),
                                maxLines: 5,
                              ),
                            ),
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
