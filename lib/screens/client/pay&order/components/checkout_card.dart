import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';


class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: BlueColor.withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,right:10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total:\n",
                      style: GoogleFonts.acme(fontSize: 17, color: BlueColor),
                      children: [
                        TextSpan(
                          text: "\$337.15",
                          style: GoogleFonts.acme(fontSize: 17, color: YellowColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width:190,
                    height: 150,
                    child: TextButton(
                      child: Text("Check Out",style: GoogleFonts.acme(
                        color:  BlueColor,
                        fontSize: 17
                      ),),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}