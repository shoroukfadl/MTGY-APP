import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/models/service_type_model.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../screens/client/newestoffers/viewservices.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({super.key, required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String? firstHalf;
  String? secondHalf;
  int index = 0;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 30) {
      firstHalf = widget.text.substring(0, 27);
    } else {
      firstHalf = widget.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
           " ${firstHalf!}...",
            style: GoogleFonts.aBeeZee(color: BlueColor, fontSize: 13),textDirection: TextDirection.rtl,
          ),
          InkWell(
            child: Text(
              "View Offer Details",
              style: GoogleFonts.acme(
                textStyle: TextStyle(color: YellowColor, fontSize: 11),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewServicesDetail(
                      image: ServiceType[index].image,
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
