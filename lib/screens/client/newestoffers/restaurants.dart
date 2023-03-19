
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/service_type_model.dart';

import '../../../shared/widgets/discription.dart';

class NewOffersRestaurants_Cafes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,bottom: 10,top: 10),
            child: Text("Newest offers".toUpperCase(),style:
            const TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: YellowColor,)),
          ),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            child: Column(
              children: List.generate(ServiceType.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10,left: 5,right: 5),
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      color:  WhiteColor,
                      boxShadow:const [
                        BoxShadow(
                            color: BlueColor,
                            spreadRadius: 2,
                            offset: Offset(0,3),
                            blurRadius: 4
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              ServiceType[index].image,
                              height: 100,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const  Text(
                                "ServiceProvider Name",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:BlueColor
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "OFFER TITLE",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color:YellowColor
                                    ),
                                  ),
                                  const SizedBox(width: 110,),
                                  Row(
                                    children: [
                                      Text("3.5 ",style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle( fontSize: 13,
                                            color: BlueColor,fontWeight: FontWeight.bold
                                            ,))),
                                      const Center(child: Icon(Icons.star_rate_rounded, color: YellowColor,size: 20,)),
                                    ],
                                  ),
                                ],
                              ),

                              DescriptionTextWidget(
                                text: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa aaaaaaaaaaa aaaaaaaaaa',)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
