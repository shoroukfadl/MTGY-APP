import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../controller/client_home_cubit/cubit.dart';
import '../../../../../controller/client_home_cubit/states.dart';
import '../../../../../services/widgets/constant.dart';
import '../../../../../services/widgets/profile_widget.dart';
import '../../../search/search.dart';
import 'agrdetials.dart';

class ArchaeologicalSites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>UHomeCubit(),
      child: BlocConsumer<UHomeCubit,UHomeStates>(
        builder: (BuildContext context , state){
          return Scaffold(
            body: ConditionalBuilder(
              condition:agr_list.isNotEmpty ,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only( left:10,right: 10,top: 40),
                              child: Container(
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
                                  icon: const Icon(Icons.arrow_back,
                                    color: YellowColor, size: 20,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 40,right: 20 ),
                              child: TextField(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  Search()),
                                  );
                                },
                                cursorColor:  BlueColor,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2, color: BlueColor,),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 2, color: BlueColor,),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  hintText: "Search For ArchaeologicalSites ",
                                  hintStyle: GoogleFonts.acme(
                                      color:  BlueColor.withOpacity(0.6), fontSize: 15
                                  ),
                                  suffixIcon: const Icon(
                                    Icons.search_rounded,
                                    color: YellowColor, size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0,right: 10,left: 10,bottom: 10),
                          child: Column(
                            children: List.generate(
                                agr_list.length ,
                                    (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: SizedBox(
                                      width: 370,
                                      height: 120,
                                      child: Card(
                                        color: BlueColor,
                                        elevation: 0.4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: InkWell(
                                          borderRadius: BorderRadius.circular(20),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => ArchaeologicalSideDetials()),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(top: 10.0,bottom: 10,left: 10),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: const BoxDecoration(
                                                      color:YellowColor,
                                                      shape: BoxShape.circle
                                                  ),
                                                  child:  const Center(
                                                    child: ProfileWidget(
                                                      imagePath: ' assets/images/elhytan.jpg',
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Center(
                                                  child:  Text(
                                                    "${agr_list[index].serviceName}".toUpperCase(),

                                                    style: GoogleFonts.aBeeZee(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.bold,
                                                        color: YellowColor
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              fallback: (BuildContext context) {
                return   Center(child: CircularProgressIndicator());
              },

            ),
          );
        },
        listener:  (context , state){},
      ),
    );
  }
}
