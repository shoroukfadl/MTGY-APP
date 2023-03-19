import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/service_type_model.dart';

import '../home/discription.dart';
import '../models/createnewpost.dart';


class Offers extends StatefulWidget {
   Offers({Key? key}) : super(key: key);

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  late TabController tabController;
  final titleController=TextEditingController();
  final _contentController = TextEditingController();
  final _priceController = TextEditingController();

  int index =0;
  int currentindex=0;
  bool isbottomsheet =false;
  IconData fabicon = Icons.edit_note;
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewPost()));
              },
              icon:  Icon(
                fabicon,
                color:  YellowColor,
                size: 25,
              )),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(ServiceType.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 15,right: 5,left: 5),
              child: SizedBox(
                height: 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: WhiteColor,
                    boxShadow:const [
                      BoxShadow(
                        color: BlueColor,
                        offset: Offset(0,2),
                        spreadRadius: 1,
                        blurRadius: 3

                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            ServiceType[index].image,
                            height: 100,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "OFFER TITLE",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color:YellowColor
                                  ),
                                ),
                                const SizedBox(width: 110,),
                                Row(
                                  children: [
                                    Text("3.5 ",style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle( fontSize: 13,
                                          color:  BlueColor,fontWeight: FontWeight.bold
                                          ,))),
                                    Center(child: const Icon(Icons.star_rate_rounded, color: YellowColor,size: 20,)),
                                  ],
                                ),
                              ],
                            ),

                            DescriptionWidget(
                              text: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaa aaaaaaaaaaa aaaaaaaaaa',)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
