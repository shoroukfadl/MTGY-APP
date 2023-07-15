
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/controller/SP_cubit/cubit.dart';
import 'package:mtgy_app/controller/SP_cubit/states.dart';
import 'package:mtgy_app/view/client/reviews/reviewUI.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../services/widgets/constant.dart';



class SPReviews extends StatelessWidget {

  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];

  SPReviews({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<SPHomeCubit,SPHomeStates>(
       builder: (context,state){
     return Scaffold(
       backgroundColor: WhiteColor,
       body: ConditionalBuilder(
         condition: SP_reviews.isNotEmpty,
         builder: (BuildContext context) {
           return  Column(
             children: [
               Container(
                 color: WhiteColor,
                 padding: const EdgeInsets.symmetric(
                   horizontal: 16.0,
                   vertical: 16.0,
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text.rich(
                           TextSpan(
                             children: [
                               TextSpan(
                                 text: "4.5",
                                 style: TextStyle(fontSize: 30.0,color: BlueColor),
                               ),
                               TextSpan(
                                 text: "/5",
                                 style: TextStyle(
                                   fontSize: 15.0,
                                   color: BlueColor,
                                 ),
                               ),
                             ],
                           ),
                         ),
                         SmoothStarRating(
                           starCount: 5,
                           rating: 4.5,
                           size: 21.0,
                           color: YellowColor,
                           borderColor:BlueColor,
                         ),
                         const SizedBox(height: 16.0),
                         Text(
                           "${SP_reviews.length}  Review",
                           style: const TextStyle(
                             fontSize: 20.0,
                             color: BlueColor,
                           ),
                         ),
                       ],
                     ),
                     Container(
                       width: 200.0,
                       child: ListView.builder(
                         shrinkWrap: true,
                         reverse: true,
                         itemCount: SP_reviews.length,
                         itemBuilder: (context, index) {
                           return Row(
                             children: [
                               Text(
                                 "${index + 1}",
                                 style: const TextStyle(fontSize: 18.0,color: BlueColor),
                               ),
                               const SizedBox(width: 4.0),
                               const Icon(Icons.star, color: YellowColor),
                               const SizedBox(width: 8.0),
                               LinearPercentIndicator(
                                 lineHeight: 6.0,
                                 // linearStrokeCap: LinearStrokeCap.roundAll,
                                 width: MediaQuery.of(context).size.width / 2.8,
                                 animation: true,
                                 animationDuration: 2500,
                                 percent: ratings[index],
                                 progressColor:YellowColor,
                               ),
                             ],
                           );
                         },
                       ),
                     ),
                   ],
                 ),
               ),
               Expanded(
                 child: ListView.separated(
                   padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                   itemCount: SP_reviews.length,
                   itemBuilder: (context, index) {
                     return ReviewUI(
                       name: SP_reviews[index].username!,
                       date: SP_reviews[index].createdat!,
                       comment: SP_reviews[index].comment!,
                       rating: SP_reviews[index].rate!,
                       // onPressed: () => print("More Action $index"),
                       // onTap: () => setState(() {
                       //   isMore = !isMore;
                       // }),
                       // isLess: isMore,
                     );
                   },
                   separatorBuilder: (context, index) {
                     return  Divider(
                       thickness: 2.0,
                       color: BlueColor.withOpacity(0.7),
                     );
                   },
                 ),
               ),
             ],
           );
         },
         fallback: (BuildContext context) {
           return Center(child: CircularProgressIndicator());
         },
       ),
     );
   }, listener: (context,state){

   });
  }
}
