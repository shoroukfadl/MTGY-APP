

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/client/home/screen/services/archaeological_side/archaeological_side_detials.dart';
import '../../../../../models/service_type_model.dart';
import '../../../../../shared/widgets/constant.dart';
import '../../../../../shared/widgets/profile_widget.dart';
import '../../../../../shared/widgets/search.dart';

class ArchaeologicalSites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Row(
      //         children: [
      //           Expanded(
      //             flex: 1,
      //             child: Padding(
      //               padding: const EdgeInsets.only( left:10,right: 10,top: 40),
      //               child: Container(
      //                 width: 40,
      //                 height: 40,
      //                 decoration: const BoxDecoration(
      //                     shape: BoxShape.circle,
      //                     color: WhiteColor,
      //                     boxShadow: [
      //                       BoxShadow(
      //                         color: BlueColor,
      //                         offset: Offset(0, 1),
      //                         blurRadius: 3.0,
      //                         spreadRadius: 1.0,
      //                       ),
      //                     ]
      //                 ), //icon inside button,
      //                 child: IconButton(
      //                   icon: const Icon(Icons.arrow_back,
      //                     color: YellowColor, size: 20,
      //                   ),
      //                   onPressed: () {
      //                     Navigator.pop(context);
      //                   },
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Expanded(
      //             flex: 4,
      //             child: Padding(
      //               padding: const EdgeInsets.only(
      //                   top: 40,right: 20 ),
      //               child: TextField(
      //                 onTap: () {
      //                   Navigator.push(
      //                     context,
      //                     MaterialPageRoute(builder: (context) => const Search()),
      //                   );
      //                 },
      //                 cursorColor:  BlueColor,
      //                 decoration: InputDecoration(
      //                   enabledBorder: OutlineInputBorder(
      //                     borderSide: const BorderSide(
      //                       width: 2, color: BlueColor,),
      //                     borderRadius: BorderRadius.circular(15),
      //                   ),
      //                   focusedBorder: OutlineInputBorder(
      //                     borderSide: const BorderSide(
      //                       width: 2, color: BlueColor,),
      //                     borderRadius: BorderRadius.circular(15),
      //                   ),
      //                   hintText: "Search For ArchaeologicalSites ",
      //                   hintStyle: GoogleFonts.acme(
      //                       color:  BlueColor.withOpacity(0.6), fontSize: 15
      //                   ),
      //                   suffixIcon: const Icon(
      //                     Icons.search_rounded,
      //                     color: YellowColor, size: 20,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       SingleChildScrollView(
      //         child: Padding(
      //           padding: const EdgeInsets.all(20.0),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Column(
      //                 children: List.generate(ServiceType.length, (index) {
      //                   return Padding(
      //                     padding: const EdgeInsets.only(bottom: 10),
      //                     child: Row(
      //                       children: [
      //                         Expanded(
      //                           child: SizedBox(
      //                             height: 180,
      //                             child: Card(
      //                               color: BlueColor,
      //                               elevation: 0.4,
      //                               shape: RoundedRectangleBorder(
      //                                 borderRadius: BorderRadius.circular(20),
      //                               ),
      //                               child: InkWell(
      //                                 borderRadius: BorderRadius.circular(20),
      //                                 onTap: () {
      //                                   Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(builder: (context) => ArchaeologicalSideDetials()),
      //                                   );
      //                                 },
      //                                 child: Padding(
      //                                   padding: const EdgeInsets.only(top: 10.0),
      //                                   child: Column(
      //                                     children: [
      //                                       Container(
      //                                         width: 120,
      //                                         height: 120,
      //                                         decoration: const BoxDecoration(
      //                                             color:YellowColor,
      //                                             shape: BoxShape.circle
      //                                         ),
      //                                         child:  Center(
      //                                           child: ProfileWidget(
      //                                             imagePath: place.imagePath,
      //                                           ),
      //                                         ),
      //                                       ),
      //
      //                                       const SizedBox(height: 5),
      //                                       Center(
      //                                         child:  Text(
      //                                           "place Name",
      //                                           style: GoogleFonts.aBeeZee(
      //                                               fontSize: 13,
      //                                               fontWeight: FontWeight.bold,
      //                                               color: YellowColor
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(width: 10,),
      //                         Expanded(
      //                           child: SizedBox(
      //                             height: 180,
      //                             child: Card(
      //                               color: BlueColor,
      //                               elevation: 0.4,
      //                               shape: RoundedRectangleBorder(
      //                                 borderRadius: BorderRadius.circular(20),
      //                               ),
      //                               child: InkWell(
      //                                 borderRadius: BorderRadius.circular(20),
      //                                 onTap: () {
      //                                   Navigator.push(
      //                                     context,
      //                                     MaterialPageRoute(builder: (context) => ArchaeologicalSideDetials()),
      //                                   );
      //                                 },
      //                                 child: Padding(
      //                                   padding: const EdgeInsets.only(top: 10.0),
      //                                   child: Column(
      //                                     children: [
      //                                       Container(
      //                                         width: 120,
      //                                         height: 120,
      //                                         decoration: const BoxDecoration(
      //                                             color:YellowColor,
      //                                             shape: BoxShape.circle
      //                                         ),
      //                                         child:  Center(
      //                                           child: ProfileWidget(
      //                                             imagePath: place.imagePath,
      //                                           ),
      //                                         ),
      //                                       ),
      //
      //                                       const SizedBox(height: 5),
      //                                       Center(
      //                                         child:  Text(
      //                                           "place Name",
      //                                           style: GoogleFonts.aBeeZee(
      //                                               fontSize: 13,
      //                                               fontWeight: FontWeight.bold,
      //                                               color: YellowColor
      //                                           ),
      //                                         ),
      //                                       ),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 }),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
    //  ),
    );
  }
}
