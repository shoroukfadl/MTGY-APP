import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/client/pay&order/components/checkout_card.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import 'package:mtgy_app/models/cart.dart';
import 'package:mtgy_app/shared/widgets/constants.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Transparent,
      elevation: 0,
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           defultbackbutton(context),
            SizedBox(width: 10,),
            Column(
              children: [
                Text(
                  "Your Cart",
                  style: GoogleFonts.acme(color: YellowColor,
                    fontSize: 20
                  ),
                ),
              SizedBox(height: 10,),
                Text(
                    "${demoCarts.length} items",
                    style: GoogleFonts.acme(
                        color: YellowColor,
                        fontSize: 13
                    ))
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
