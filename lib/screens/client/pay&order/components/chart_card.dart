import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/cart.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

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
                child: Image.asset(cart.product.image),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: TextStyle(color:BlueColor, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "\$${cart.product.price}",
                  style: GoogleFonts.acme(
                      fontWeight: FontWeight.w600, color: YellowColor
                  ),
                  children: [

                    TextSpan(
                        text: " x${cart.numOfpeople}",
                        style: GoogleFonts.acme(
                          color: BlueColor
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