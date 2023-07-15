import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../view/client/home/services/offerdetails.dart';
import 'constant.dart';



class DescriptionWidget extends StatefulWidget {
  final String text;

  DescriptionWidget({super.key, required this.text});

  @override
  _DescriptionWidgetState createState() => new _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  String? firstHalf;
  String? secondHalf;
  int index=0;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 30) {
      firstHalf = widget.text.substring(0, 30);
    } else {
      firstHalf = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const  EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(firstHalf!,style: GoogleFonts.aBeeZee(
              color: BlueColor,fontSize: 13
          ),),
          InkWell(
            child:  Text(
              "View Offer Details",
              style: GoogleFonts.acme(textStyle:
              TextStyle(color:  YellowColor,fontSize: 11),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewofferDetail(
                      image:"",
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}