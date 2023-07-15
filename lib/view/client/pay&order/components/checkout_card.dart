import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/widgets/constant.dart';
import '../pay.dart';



class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  void checkout(){
    for(int i =0; i<getcart_list.length ; i++){
      totalcost+= getcart_list[i].price!;
    }
  }
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
                          text: "$totalcost EP",
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
                      onPressed: () {
                         Navigator.pushAndRemoveUntil(
                             context, MaterialPageRoute(builder: (context)=>Paymnet()
                         ), (route) => false);
                      },
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