import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant.dart';

class DescriptionNameWidget extends StatefulWidget {
  final String text;

  DescriptionNameWidget({super.key, required this.text});

  @override
  _DescriptionNameWidgetState createState() => new _DescriptionNameWidgetState();
}

class _DescriptionNameWidgetState extends State<DescriptionNameWidget> {
  String? firstHalf;
  String? secondHalf;
  int index=0;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 20) {
      firstHalf = widget.text.substring(0, 20);
    } else {
      firstHalf = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
         return Center(
            child: Text(firstHalf!,style: GoogleFonts.acme(
                color:  YellowColor,fontSize: 13
            ),),

    );
  }
}