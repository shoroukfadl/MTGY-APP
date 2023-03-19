import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/signin/screens/client/cilent_signin.dart';
import 'package:mtgy_app/shared/network/chache_helper.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/shared/widgets/profile_widget.dart';

import '../../models/dis_serviceprovider_name.dart';
import '../../models/service_type_model.dart';
import 'discription.dart';

Widget defultTextFromField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validator,
  required String labeltext,
}) =>
    TextFormField(
      controller: controller,
      style: GoogleFonts.acme(color: YellowColor),
      keyboardType: type,
      validator: (s) {
        return validator(s);
      },
      decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: BlueColor, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: YellowColor, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: BlueColor, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: YellowColor, width: 1)),
          contentPadding: const EdgeInsets.only(left: 20),
          labelText: labeltext,
          labelStyle: GoogleFonts.acme(
              textStyle:
                  TextStyle(color: YellowColor.withOpacity(0.6), fontSize: 13)),
          border: InputBorder.none),
      cursorColor: YellowColor,
    );

Widget defultpassTextFromField({
  required TextEditingController controller,
  required Function ontap,
  required String labeltext,
  required bool passtoggle,
}) =>
    TextFormField(
      controller: controller,
      style: GoogleFonts.acme(color: YellowColor),
      keyboardType: TextInputType.visiblePassword,
      obscuringCharacter: "*",
      validator: (value) {
        if (value!.isEmpty)
          return 'Enter password';
        else if (controller.text.length < 6) {
          return 'password length should not be less than 6 characters';
        }
      },
      obscureText: passtoggle,
      cursorColor: YellowColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: BlueColor,
              width: 1,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: YellowColor,
              width: 1,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: BlueColor,
              width: 1,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: YellowColor,
              width: 1,
            )),
        suffixIcon: InkWell(
          onTap: () {
            return ontap();
          },
          child: Icon(
            passtoggle
                ? Icons.visibility_off_rounded
                : Icons.visibility_rounded,
            color: YellowColor,
            size: 20,
          ),
        ),
        labelText: labeltext,
        labelStyle: GoogleFonts.acme(
            textStyle:
                TextStyle(color: YellowColor.withOpacity(0.6), fontSize: 13)),
        focusColor: YellowColor,
        errorStyle: GoogleFonts.acme(color: BlueColor),
        border: InputBorder.none,
      ),
    );

Widget defultnewoffer({required List<ServiceTypeModel> model}) =>
    SingleChildScrollView(
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
                                model[0].image,
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
                                model[0].image,
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
                                model[0].image,
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
                                model[0].image,
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

Widget defultbackbutton(context) => Container(
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
          ]), //icon inside button,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: YellowColor,
          size: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );

Widget defultoffers({
  required Function ontap1,
  required Function ontap2,
  required String image,
  required String name,
  required String rate,


}) =>
    SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Expanded(
                  child: SizedBox(
                    height: 220,
                    width: 220,
                    child: Card(
                      color: BlueColor,
                      elevation: 0.4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                          return ontap1();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12, top: 15),
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: 120,
                                    height: 120,
                                    decoration: const BoxDecoration(
                                        color: YellowColor,
                                        shape: BoxShape.circle),
                                  ),
                                  ProfileWidget(
                                    imagePath: image,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Center(
                                child: DescriptionNameWidget(
                                  text: name,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(rate,
                                      style: GoogleFonts.aBeeZee(
                                          textStyle: const TextStyle(
                                        fontSize: 13,
                                        color: WhiteColor,
                                        fontWeight: FontWeight.bold,
                                      ))),
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: YellowColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
        ],
      ),
    );

void submit(context)
{
  CacheHelper.saveData(key: "client", value: true).then((value) {
    if(value)
      {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=> ClientSignIn2()), (route) => false);
      }
  });
}