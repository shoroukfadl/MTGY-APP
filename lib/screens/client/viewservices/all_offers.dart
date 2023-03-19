
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/service_type_model.dart';

import '../../../shared/widgets/discription.dart';


class AllServiceProviderOffers extends StatelessWidget {
  @override
  int index =0;
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
            child: Container(
              height: 104,
              decoration: BoxDecoration(
                color: WhiteColor,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            "اجازه العيد معانا",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color:YellowColor
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: DescriptionTextWidget(
                            text: 'في العيد محتاج الروقان و الاستجمام, عشان كده وفرنالك المكان الي يساعدك علي ده بغرفه تطل علي منظر ياخدك لعالم تاني  ',),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
            child: Container(
              height: 104,
              decoration: BoxDecoration(
                color: WhiteColor,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            "الصيف",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color:YellowColor
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: DescriptionTextWidget(
                            text: 'وفرنالك المكان الي يساعدك علي الراحه و الانسجمام بغرفه تطل علي منظر ياخدك لعالم تاني  ',),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15,left: 15,right: 15),
            child: Container(
              height: 104,
              decoration: BoxDecoration(
                color: WhiteColor,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            "اجازه العيد معانا",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color:YellowColor
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: DescriptionTextWidget(
                            text: 'في العيد محتاج الروقان و الاستجمام, عشان كده وفرنالك المكان الي يساعدك علي ده بغرفه تطل علي منظر ياخدك لعالم تاني  ',),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ]
        ),
    );
  }
}
