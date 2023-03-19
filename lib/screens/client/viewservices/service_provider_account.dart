import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/serviceprovider.dart';
import 'package:mtgy_app/models/utils/serviceprovider_preferences.dart';

import '../../../shared/widgets/profile_widget.dart';
import '../../reviews/addreview.dart';
import '../../reviews/view_reviews.dart';
import '../../serviceprovider/chats/models/message_model.dart';
import '../../serviceprovider/chats/screens/chat_screen.dart';
import 'all_offers.dart';


class ServicesProviderAccount extends StatefulWidget {
  const ServicesProviderAccount({Key? key}) : super(key: key);

  @override
  State<ServicesProviderAccount> createState() => _ServicesProviderAccountState();
}

class _ServicesProviderAccountState extends State<ServicesProviderAccount>  with TickerProviderStateMixin{
  @override
  int index =0;
  Widget build(BuildContext context) {
    final serviceprovider = ServiceProviderPreferences.serviceprovider;
    final Message chat = chats[index];
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left :3.0,),
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
                      ProfileWidget(
                        imagePath: serviceprovider.imagePath,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      buildName(serviceprovider),
                      const SizedBox(height: 8),
                      buildemail(serviceprovider),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell(
                          //   onTap: (){
                          //     Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => ChatScreen(
                          //     user:chat.sender,
                          //     )),
                          //     );
                          //     },
                          //   child: Container(
                          //     width: 150,
                          //     height: 30,
                          //     decoration:    BoxDecoration(
                          //          border: Border.all(width: 2.0,color: BlueColor ),
                          //         borderRadius: const BorderRadius.all(Radius.circular(20)),
                          //       ),
                          //     child:  Padding(
                          //       padding: const EdgeInsets.only(left: 15.0),
                          //       child: Row(
                          //         children: [
                          //           Text("Send Message",style: GoogleFonts.lobster(color:BlueColor),),
                          //           const SizedBox(width: 10,),
                          //            const Icon(Icons.messenger,size: 20,
                          //             color: YellowColor,),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>ReviewsPage()
                                  )
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 30,
                              decoration:    BoxDecoration(
                                border: Border.all(width: 2.0,color: BlueColor ),
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Row(
                                  children: [
                                    Text("View Reviews ",style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle( fontSize: 13,
                                          color: BlueColor,fontWeight: FontWeight.bold
                                          ,))),
                                    const Icon(Icons.reviews, color: YellowColor,size: 20,),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15,),
                          InkWell(
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
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  children: [
                                    Text("Add Review",style: GoogleFonts.lobster(color:BlueColor),),
                                    const SizedBox(width: 10,),
                                    const Icon(Icons.rate_review_rounded,size: 20,
                                      color: YellowColor,),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,top:3.0),
                        child: Row(
                            children:[
                              const Icon(Icons.phone,size: 15,color: YellowColor,),
                              const SizedBox(width: 8,),
                              buildphone(serviceprovider)
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0,top:3.0),
                        child: Row(
                            children:[
                              const Icon(Icons.location_on_rounded,size: 15,color:YellowColor,),
                              const SizedBox(width: 8,),
                              buildaddres(serviceprovider)
                            ]
                        ),
                      ) ,
                    ),
                  ),
                  const SizedBox(width: 5,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30,right:20,top: 20),
                child: buildAbout(serviceprovider),
              ),
              const SizedBox(height: 15,),
              AllServiceProviderOffers(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildName(ServiceProvider serviceprovider) => Text(
    serviceprovider.name,
    style: GoogleFonts.actor(textStyle:  const TextStyle(
      fontSize: 20,color:BlueColor,fontWeight: FontWeight.bold,)),
  );
  Widget buildemail(ServiceProvider serviceprovider) => Text(
    serviceprovider.email,
    style: GoogleFonts.lobster(color: BlueColor.withOpacity(.7)),
  );
  Widget buildphone(ServiceProvider serviceprovider) => Text(
    serviceprovider.phone,
    style: GoogleFonts.lobster(color: BlueColor.withOpacity(.7)),
  );
  Widget buildaddres(ServiceProvider serviceprovider) => Text(
    serviceprovider.address,
    style: GoogleFonts.lobster(color: BlueColor.withOpacity(.7)),
  );
  Widget buildAbout(ServiceProvider serviceprovider) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'ABOUT',
                style: GoogleFonts.actor(textStyle:  const TextStyle(
                  fontSize: 20,color:YellowColor,fontWeight: FontWeight.bold,)),
              ),
            ),
          ),
          // InkWell(
          //   onTap: (){
          //     Navigator.push(context,
          //          MaterialPageRoute(builder: (context)=>ReviewsPage()
          //          )
          //     );
          //   },
          //   child: Container(
          //     width: 150,
          //     height: 30,
          //     decoration:    BoxDecoration(
          //       border: Border.all(width: 2.0,color: BlueColor ),
          //         borderRadius: const BorderRadius.all(Radius.circular(20)),
          //     ),
          //     child:  Padding(
          //       padding: const EdgeInsets.only(left: 20.0),
          //       child: Row(
          //         children: [
          //           Text("View Reviews ",style: GoogleFonts.aBeeZee(
          //               textStyle: const TextStyle( fontSize: 13,
          //                 color: BlueColor,fontWeight: FontWeight.bold
          //                 ,))),
          //           const Icon(Icons.reviews, color: YellowColor,size: 20,),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
      const SizedBox(height: 10),
      Text(
        serviceprovider.about,
        style: GoogleFonts.fredoka(fontSize: 14, height: 1.4,color:  BlueColor.withOpacity(0.9)),
        maxLines: 5,
      ),
    ],
  );
}
