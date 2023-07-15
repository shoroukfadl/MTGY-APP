import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../services/widgets/constant.dart';

class ReviewUI extends StatelessWidget {
 // final String image;
  final String  name, date, comment;
  final int rating;
  //final Function() onTap, onPressed;
  //final bool isLess;
  const ReviewUI({
  //  required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
  //  required this.onTap,
  //  required this.isLess,
  //  required this.onPressed,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 16.0,
        right: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Container(
              //   height: 45.0,
              //   width: 45.0,
              //   margin: const EdgeInsets.only(right: 16.0),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage(image),
              //       fit: BoxFit.cover,
              //     ),
              //     borderRadius: BorderRadius.circular(44.0),
              //   ),
              // ),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: BlueColor
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              SmoothStarRating(
                starCount: 5,
                rating: rating.toDouble(),
                size: 28.0,
                color: YellowColor,
                borderColor: YellowColor,
              ),
              const SizedBox(width: kFixPadding),
              Text(
                date,
                style: const TextStyle(fontSize: 18.0,color: BlueColor),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          GestureDetector(
          // onTap: onTap(),
            child: true
                ? Text(
                    comment,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: BlueColor,
                    ),
                  )
                : Text(
                    comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: BlueColor,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
