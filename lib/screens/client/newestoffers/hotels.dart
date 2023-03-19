
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/models/service_type_model.dart';
import '../../../shared/widgets/constant.dart';
import '../../../shared/widgets/constants.dart';
import '../../../shared/widgets/discription.dart';


class NewOffersHotels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 10, top: 10),
            child: Text("Newest offers".toUpperCase(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: YellowColor,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: WhiteColor,
                        boxShadow: const [
                          BoxShadow(
                              color: BlueColor,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, top: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  ServiceType[0].image,
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Hotel1",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: BlueColor),
                                    ),
                                    const SizedBox(
                                      width: 170,
                                    ),
                                    Row(
                                      children: [
                                        Text("3.5 ",
                                            style: GoogleFonts.aBeeZee(
                                                textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  color: BlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                        const Center(
                                            child: Icon(
                                              Icons.star_rate_rounded,
                                              color: YellowColor,
                                              size: 20,
                                            )),
                                      ],
                                    ),

                                  ],
                                ),
                                const Center(
                                  child: Text(
                                    "العيد السعيد",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: YellowColor),
                                  ),
                                ),
                                DescriptionTextWidget(
                                  text:
                                  'استمتع بليالي العيد بالمرح و الروقان و احجز غرفه ',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: WhiteColor,
                        boxShadow: const [
                          BoxShadow(
                              color: BlueColor,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, top: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  ServiceType[0].image,
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Hotel2",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: BlueColor),
                                    ),
                                    const SizedBox(
                                      width: 170,
                                    ),
                                    Row(
                                      children: [
                                        Text("3.5 ",
                                            style: GoogleFonts.aBeeZee(
                                                textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  color: BlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                        const Center(
                                            child: Icon(
                                              Icons.star_rate_rounded,
                                              color: YellowColor,
                                              size: 20,
                                            )),
                                      ],
                                    ),

                                  ],
                                ),
                                const Center(
                                  child: Text(
                                    "الصيف الرايق",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: YellowColor),
                                  ),
                                ),
                                DescriptionTextWidget(
                                  text:
                                  'وفرنالك المكان الي يساعدك علي الراحه و الانسجمام بغرفه تطل علي منظر ياخدك لعالم تاني ',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: WhiteColor,
                        boxShadow: const [
                          BoxShadow(
                              color: BlueColor,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, top: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  ServiceType[0].image,
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Hotel3",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: BlueColor),
                                    ),
                                    const SizedBox(
                                      width: 170,
                                    ),
                                    Row(
                                      children: [
                                        Text("3.5 ",
                                            style: GoogleFonts.aBeeZee(
                                                textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  color: BlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                        const Center(
                                            child: Icon(
                                              Icons.star_rate_rounded,
                                              color: YellowColor,
                                              size: 20,
                                            )),
                                      ],
                                    ),

                                  ],
                                ),
                                const Center(
                                  child:  Text(
                                    "الصيف",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: YellowColor),
                                  ),
                                ),
                                DescriptionTextWidget(
                                  text:
                                  'انت و فيروز و الهوا و جمال البحر ,استمتع بحجز غرفه ',
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: WhiteColor,
                        boxShadow: const [
                          BoxShadow(
                              color: BlueColor,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(left: 8.0, top: 12),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  ServiceType[0].image,
                                  height: 100,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Hotel4",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: BlueColor),
                                    ),
                                    const SizedBox(
                                      width: 170,
                                    ),
                                    Row(

                                      children: [
                                        Text("3 ",
                                            style: GoogleFonts.aBeeZee(
                                                textStyle: const TextStyle(
                                                  fontSize: 13,
                                                  color: BlueColor,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                        const Center(
                                            child: Icon(
                                              Icons.star_rate_rounded,
                                              color: YellowColor,
                                              size: 20,
                                            )),
                                      ],
                                    ),

                                  ],
                                ),
                                const Center(
                                  child:  Text(
                                    "اجازه العيد معانا",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: YellowColor),
                                  ),
                                ),
                                DescriptionTextWidget(
                                  text: 'في العيد محتاج الروقان و الاستجمام, عشان كده وفرنالك المكان الي يساعدك علي ده بغرفه تطل علي منظر ياخدك لعالم تاني  ',

                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]
            ),
          ),

        ],
      ),
    );
  }
}
