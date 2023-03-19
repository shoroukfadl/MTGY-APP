import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/models/services_models/Natural/Natural.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

Widget buildName(getNaturalModel place,int index) => Text(
     "", //place.data!.Natural_list[index].name!,
      style: GoogleFonts.actor(
          textStyle: const TextStyle(
        fontSize: 20,
        color: YellowColor,
        fontWeight: FontWeight.bold,
      )),
    );
//
// Widget buildAddress(Place place) => Text(
//       place.address,
//       style: GoogleFonts.actor(
//           textStyle: const TextStyle(
//         fontSize: 15,
//         color: BlueColor,
//         fontWeight: FontWeight.bold,
//       )),
//     );
//
// Widget buildDayWork(Place place) => Text(
//       place.Work_day,
//       style: GoogleFonts.actor(
//           textStyle: const TextStyle(
//         fontSize: 15,
//         color: BlueColor,
//         fontWeight: FontWeight.bold,
//       )),
//     );

Widget buildTimeWork(getNaturalModel place,int index) => Text(
     ""// place.data!.Natural_list[index].time!,
      ,style: GoogleFonts.actor(
          textStyle: const TextStyle(
        fontSize: 15,
        color: BlueColor,
        fontWeight: FontWeight.bold,
      )),
    );

// Widget buildAbout(Place place) => Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Center(
//             child: Text(
//               'About'.toUpperCase(),
//               style: GoogleFonts.actor(
//                   textStyle: TextStyle(
//                 fontSize: 20,
//                 color: BlueColor,
//                 fontWeight: FontWeight.bold,
//               )),
//             ),
//           ),
//           const SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.only(left: 30, right: 20),
//             child: Text(
//               place.about,
//               style: GoogleFonts.fredoka(
//                   fontSize: 13,
//                   height: 1.4,
//                   color: YellowColor.withOpacity(0.6)),
//             ),
//           ),
//         ],
//       ),
//     );
