import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/controller/SP_cubit/cubit.dart';
import 'package:mtgy_app/controller/SP_cubit/states.dart';
import '../../../../../services/widgets/discription.dart';
import '../../../../services/widgets/constant.dart';
import '../../create_offers/createnewpost.dart';


class Offers extends StatefulWidget {
   Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  late TabController tabController;
  bool isbottomsheet =false;
  IconData fabicon = Icons.edit_note;
  int index2 =0;
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SPHomeCubit,SPHomeStates>(
      builder: (context ,state){
        print(offer_list.length);
        return  Scaffold(
          floatingActionButton:   Padding(
            padding: const EdgeInsets.only(right: 10,),
            child: Container(
              width: 55,
              height: 55,
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
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateNewPost()));
              },
                  icon:  Icon(
                    fabicon,
                    color:  YellowColor,
                    size: 23,
                  )),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(offer_list.length, (index2) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 20,right: 20),
                  child: Container(

                      width: double.infinity,
                      decoration:const BoxDecoration(
                        color: WhiteColor,
                        shape: BoxShape.rectangle,
                        boxShadow:  [
                          BoxShadow(
                              color: BlueColor,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              blurRadius: 4)
                        ],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)
                        ),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 10,bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10,),
                                Text(
                                  offer_list[index2].title!.toUpperCase(),
                                  style: GoogleFonts.actor(textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 20,color: YellowColor,
                                  )),
                                ),
                                const SizedBox(height: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price : ",
                                      style: GoogleFonts.actor(textStyle: const TextStyle(
                                        fontSize: 20,color: YellowColor,
                                      )),
                                    ),
                                    Text(
                                      offer_list[index2].price!.toString(),
                                      style: GoogleFonts.aBeeZee(textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,fontSize: 15,color: BlueColor,
                                      )),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Details : ",
                                      style: GoogleFonts.actor(textStyle: const TextStyle(
                                       fontSize: 20,color: YellowColor,
                                      )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:20.0,right: 20),                                      child: Text(
                                        offer_list[index2].content!,
                                        style: GoogleFonts.actor(textStyle:  TextStyle(
                                          fontSize: 15,color: BlueColor,)),
                                        maxLines: 5,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                );
              }),
            ),
          ),
        );
      },
      listener: (context ,state){

      },
    );
  }
}
