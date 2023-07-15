import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/services_models/ArchaeologicalSite/archaeologicalSite.dart';
import '../../model/services_models/Natural/Natural.dart';
import 'constant.dart';


Widget buildName(List<DataModel> list,int index) => Text(
  list[index].serviceName!.toUpperCase(),
      style: GoogleFonts.actor(
          textStyle: const TextStyle(
        fontSize: 20,
        color: YellowColor,
        fontWeight: FontWeight.bold,
      )),
    );

Widget buildAddress(List<DataModel> list,int index) => Text(
     list[index].address!,
      style: GoogleFonts.actor(
          textStyle: const TextStyle(
        fontSize: 15,
        color: BlueColor,
        fontWeight: FontWeight.bold,
      )),
    );

Widget buildDayWork(List<DataModel> list,int index) => Text(
     list[index].date!,
      style: GoogleFonts.actor(
          textStyle: const TextStyle(
        fontSize: 15,
        color: BlueColor,
        fontWeight: FontWeight.bold,
      )),
    );

Widget buildTimeWork(List<DataModel> list,int index) => Text(
       list[index].time!
      ,style: GoogleFonts.actor(
          textStyle: const TextStyle(
        fontSize: 15,
        color: BlueColor,
        fontWeight: FontWeight.bold,
      )),
    );

Widget buildAbout(List<DataModel> list,int index) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center(
          //   child: Text(
          //     'About'.toUpperCase(),
          //     style: GoogleFonts.actor(
          //         textStyle: TextStyle(
          //       fontSize: 20,
          //       color: BlueColor,
          //       fontWeight: FontWeight.bold,
          //     )),
          //   ),
          // ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Text(
              list[index].about!,
              style: GoogleFonts.fredoka(
                  fontSize: 15,
                  height: 1.4,
                  color: YellowColor.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );
Widget buildAbout2(List<AgrDataModel> list,int index) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center(
          //   child: Text(
          //     'About'.toUpperCase(),
          //     style: GoogleFonts.actor(
          //         textStyle: TextStyle(
          //       fontSize: 20,
          //       color: BlueColor,
          //       fontWeight: FontWeight.bold,
          //     )),
          //   ),
          // ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Text(
              list[index].about!,
              style: GoogleFonts.fredoka(
                  fontSize: 15,
                  height: 1.4,
                  color: YellowColor.withOpacity(0.8)),
            ),
          ),
        ],
      ),
    );

Widget buildName2(List<AgrDataModel> list,int index) => Text(
  list[index].serviceName!.toUpperCase(),
  style: GoogleFonts.actor(
      textStyle: const TextStyle(
        fontSize: 20,
        color: YellowColor,
        fontWeight: FontWeight.bold,
      )),
);

Widget buildAddress2(List<AgrDataModel> list,int index) => Text(
  list[index].address!,
  style: GoogleFonts.actor(
      textStyle: const TextStyle(
        fontSize: 15,
        color: BlueColor,
        fontWeight: FontWeight.bold,
      )),
);

Widget buildDayWork2(List<AgrDataModel> list,int index) => Text(
  list[index].date!,
  style: GoogleFonts.actor(
      textStyle: const TextStyle(
        fontSize: 15,
        color: BlueColor,
        fontWeight: FontWeight.bold,
      )),
);

Widget buildTimeWork2(List<AgrDataModel> list,int index) => Text(
  list[index].time!
  ,style: GoogleFonts.actor(
    textStyle: const TextStyle(
      fontSize: 15,
      color: BlueColor,
      fontWeight: FontWeight.bold,
    )),
);

