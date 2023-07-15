import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/client_home_cubit/cubit.dart';
import '../../../controller/client_home_cubit/states.dart';
import '../../../services/widgets/constant.dart';


class ReviewDialog extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> UHomeCubit(),
      child: BlocConsumer<UHomeCubit,UHomeStates>(
        builder: (BuildContext context , state){
          return ConditionalBuilder(
            condition:state is! addreviewsLoadingState ,
            builder: (BuildContext context) {
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
                      initialRating: 2 ,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) =>const Icon(
                        Icons.star_rounded,
                        color: YellowColor,
                        size: 15,
                      ),
                      onRatingUpdate: (value) {
                           return UHomeCubit.get(context).rate(value);
                      },
                    ),
                    SizedBox(height: 10),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: UHomeCubit.get(context).commentcontroller,
                        maxLines: 5,
                        validator:(value) {
                          bool namevalid =
                          RegExp(r"[A-Za-z]+|\s")
                              .hasMatch(value!);
                          if (value.isEmpty)
                            return 'Enter Comment';
                          if (!namevalid) {
                            return 'Enter valid Comment';
                          }
                        },
                        decoration: InputDecoration(
                            hintText: 'Write your comment...',
                            hintStyle:GoogleFonts.acme(fontSize:15,color:Color.fromRGBO(2, 56, 89, 1.0)) ,
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: BlueColor, width: 1)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: YellowColor, width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: BlueColor, width: 1)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(color: YellowColor, width: 1)),
                            contentPadding: const EdgeInsets.only(left: 20),
                            errorStyle: GoogleFonts.acme(color: BlueColor),
                            border: InputBorder.none),
                        cursorColor: YellowColor,
                        onChanged: (value) {

                        },
                      ),
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
                      if(_formKey.currentState!.validate())
                      {
                        UHomeCubit.get(context).Uaddreview(
                            id: spprofilemodel2!.data!.id!,
                            rate: UHomeCubit.get(context).rating.toInt(),
                            comment: UHomeCubit.get(context).commentcontroller.text
                        );
                      }
                    },
                    child: Text('Review',style:GoogleFonts.acme(fontSize:15,color:YellowColor)),
                  ),
                ],
              );
            },
            fallback: (BuildContext context) {
              return  Center(child: CircularProgressIndicator());
            },
          );
        },
        listener:  (context , state){
          if(state is addreviewsSuccessState){
            Fluttertoast.showToast(
                msg: state.model.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 3,
                backgroundColor: YellowColor,
                textColor: Colors.white,
                fontSize: 16.0
            ).then((value) => Navigator.pop(context));
          }
        },
      ),
    );
  }
}
