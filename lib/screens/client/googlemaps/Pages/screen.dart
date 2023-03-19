import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import '../../../../shared/widgets/search.dart';
import 'map/map_page.dart';
import 'map/map_screen.dart';

class SearchType extends StatefulWidget {
  const SearchType({Key? key}) : super(key: key);

  @override
  State<SearchType> createState() => _SearchTypeState();
}

class _SearchTypeState extends State<SearchType> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
     body: Column(
       children: [
         Text("YOU CAN SEARCH BY",style: GoogleFonts.acme(
           color: YellowColor,
         ),),
         Row(
           children: [
             Text(" SERVICE NAME",style: GoogleFonts.aBeeZee(
               color: BlueColor,
             ),),
             IconButton(onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Search()
               ));
             }, icon: Icon(
               Icons.drive_file_rename_outline_rounded
             ))
           ],
         ),
         Row(
           children: [
             Text(" LOCATION",style: GoogleFonts.aBeeZee(
               color: BlueColor,
             ),),
             IconButton(onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapPage()
               ));
             }, icon: Icon(
                 Icons.location_pin
             ))
           ],
         ),
       ],
     ),
    );
  }
}
