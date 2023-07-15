import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../model/order_pay/get_cart.dart';
import '../../../../services/widgets/constant.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final getcartDataModel cart;



  @override
  Widget build(BuildContext context) {
    return
   Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/images/hotel.jpg"),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.serviceName!,
                style: TextStyle(color:BlueColor, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "${cart.price}",
                  style: GoogleFonts.acme(
                      fontWeight: FontWeight.w600, color: YellowColor
                  ),
                  children: [
                    TextSpan(
                        text: " x${cart.amount}",
                        style: GoogleFonts.acme(
                          color: BlueColor,fontSize: 17
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      );
  }
}