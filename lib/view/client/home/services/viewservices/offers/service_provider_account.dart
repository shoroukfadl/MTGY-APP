import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/service_provider_account.dart';
import 'package:mtgy_app/view/client/pay&order/cart.dart';
import 'package:mtgy_app/view/client/reviews/addreview.dart';

import '../../../../../../controller/client_home_cubit/cubit.dart';
import '../../../../../../controller/client_home_cubit/states.dart';
import '../../../../../../services/widgets/component.dart';
import '../../../../../../services/widgets/constant.dart';
import '../../../../../../services/widgets/profile_widget.dart';
import '../../../../pay&order/pay.dart';
import '../../../../reviews/myreviews.dart';
import '../all_offers.dart';

class ServicesProviderAccount extends StatelessWidget {

  ServicesProviderAccount({super.key});
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>UHomeCubit(),
      child: BlocConsumer<UHomeCubit,UHomeStates>
        (
        builder: ( context,state){
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: WhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: BlueColor,
                        offset: Offset(0, 1),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                      ),
                    ]
                ), //icon inside button,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back, color: YellowColor, size: 20,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition:  spprofilemodel2!.data != null,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.only(left :4.0,),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 120,
                                      decoration: const BoxDecoration(
                                          color:YellowColor,
                                          shape: BoxShape.circle

                                      ),
                                    ),
                                    const ProfileWidget(
                                      imagePath: "assets/images/hotel.jpg",
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  children: [
                                    Text(
                                        spprofilemodel2!.data!.serviceName!.toUpperCase(),
                                        style: GoogleFonts.actor(textStyle:  const TextStyle(
                                          fontSize: 20,color:BlueColor,fontWeight: FontWeight.bold,))),
                                     const SizedBox(height: 8),
                                    Text(
                                      spprofilemodel2!.data!.email!,
                                      style: GoogleFonts.lobster(color: BlueColor.withOpacity(.7)),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(width: 20,),
                                           Expanded(flex: 1,child: InkWell(
                                        onTap: ()=>
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return ReviewDialog();
                                                }
                                            ),
                                        child: Container(
                                          width: 150,
                                          height: 30,
                                          decoration:    BoxDecoration(
                                            border: Border.all(width: 2.0,color: BlueColor ),
                                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                                          ),
                                          child:  Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Add Review",style: GoogleFonts.lobster(color:BlueColor),),
                                              const SizedBox(width: 10,),
                                              const Icon(Icons.rate_review_rounded,size: 20,
                                                color: YellowColor,),

                                            ],
                                          ),
                                        ),
                                      ),),
                                          const SizedBox(width: 30,),
                                          Expanded(flex: 1,child: InkWell(
                                            onTap: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(builder: (context)=>CViewReviews()
                                                  )
                                              );
                                            },
                                            child: Container(
                                              width: 200,
                                              height: 30,
                                              decoration:    BoxDecoration(
                                                border: Border.all(width: 2.0,color: BlueColor ),
                                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                              ),
                                              child:  Padding(
                                                padding: const EdgeInsets.only(left: 10.0),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text("View Reviews ",style: GoogleFonts.lobster(
                                                          textStyle: const TextStyle( fontSize: 15,
                                                            color: BlueColor,
                                                            ))),
                                                      const Icon(Icons.reviews, color: YellowColor,size: 20,),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),),
                                          const SizedBox(width: 20,),
                                         ]
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              children: [
                                const SizedBox(width: 5,),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color:  YellowColor.withOpacity(.8), width:2,
                                          )
                                      ),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.only(left: 15.0,top:3.0),
                                      child: Row(
                                          children:[
                                            Icon(Icons.phone,size: 15,color: YellowColor,),
                                            SizedBox(width: 8,),
                                            Text(
                                              spprofilemodel2!.data!.phoneNumber!,
                                              style: GoogleFonts.lobster(color: BlueColor.withOpacity(.7)),
                                            )
                                          ]
                                      ),
                                    ) ,
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Expanded(
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                            color:  YellowColor.withOpacity(.8), width:2,

                                          )
                                      ),
                                    ),
                                    child:  Padding(
                                      padding: EdgeInsets.only(left: 15.0,top:3.0),
                                      child: Row(
                                          children:[
                                            Icon(Icons.location_on_rounded,size: 15,color:YellowColor,),
                                            SizedBox(width: 8,),
                                            Text(
                                              spprofilemodel2!.data!.address!,
                                              style: GoogleFonts.lobster(color: BlueColor.withOpacity(.7)),
                                            )
                                          ]
                                      ),
                                    ) ,
                                  ),
                                ),
                                const SizedBox(width: 5,),
                              ],
                            ),
                            const SizedBox(height: 15,),
                            AllServiceProviderOffers(),
                          ]
                      )
                  ),
                );
              },
              fallback: (BuildContext context) {
                return CircularProgressIndicator();
              },
            ),
          );
        },
        listener: (context,state){

        },
      )
    );
  }
}