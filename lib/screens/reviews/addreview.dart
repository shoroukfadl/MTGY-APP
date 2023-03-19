import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/data_model.dart';
import 'package:flutter/material.dart';

class ReviewDialog extends StatefulWidget {
  @override
  _ReviewDialogState createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  double rating = 0.0;
  String _comment = '';
  final commentcontroller= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Write a review'),
      titleTextStyle:  GoogleFonts.acme(fontSize:20,color:YellowColor),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Rate Our Partner',style:GoogleFonts.acme(fontSize:15,color:Color.fromRGBO(2, 56, 89, 1.0) ,)),
          SizedBox(height: 10),
          RatingBar.builder(
            glowColor:YellowColor ,
            unratedColor:  BlueColor.withOpacity(0.8),
            initialRating: rating,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) =>const Icon(
              Icons.star_rounded,
              color: YellowColor,
              size: 15,
            ),
            onRatingUpdate: (value) {
              setState(() {
                rating = value;
              });
            },
          ),

          SizedBox(height: 10),
          TextFormField(
            controller: commentcontroller,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'Write your comment...',
              hintStyle:GoogleFonts.acme(fontSize:15,color:Color.fromRGBO(2, 56, 89, 1.0)) ,
              enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      color:YellowColor
                  )
              ) ,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                    color:YellowColor
                )
              ),
            ),
            onChanged: (value) {
              setState(() {
                _comment = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel',style: GoogleFonts.acme(color:YellowColor,fontSize:15),),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:Color.fromRGBO(2, 56, 89, 1.0),
          ),
          onPressed: () {
            // Here you can send the rating and comment to your backend
            Navigator.pop(context);
          },
          child: Text('Review',style:GoogleFonts.acme(fontSize:15,color:YellowColor)),
        ),
      ],
    );
  }
}
