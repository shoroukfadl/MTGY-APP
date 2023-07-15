import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../controller/client_home_cubit/cubit.dart';
import '../../../../../controller/client_home_cubit/states.dart';
import '../../../../../services/widgets/acount_style.dart';
import '../../../../../services/widgets/constant.dart';


class NaturalDetials extends StatelessWidget {
  const NaturalDetials({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UHomeCubit, UHomeStates>(
        builder: (context ,state){
          return Scaffold(
            body: ConditionalBuilder(
              condition: Natural_list.isNotEmpty,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Stack(
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:  AssetImage( " assets/images/elhytan.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 10),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: WhiteColor.withOpacity(0.7)
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back,color:  BlueColor,size: 20,),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(top:400),
                        child: Container(
                          width:
                          double.infinity,
                          height: 900,
                          decoration: const  BoxDecoration(
                              color: WhiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Center(child: buildName(Natural_list, 0)),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left:40.0,right: 40),
                                child: Container(
                                  width: double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color: YellowColor.withOpacity(.7), width:2,

                                        )
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.location_on_rounded,size: 20,color: YellowColor ,),
                                      const SizedBox(width:5),
                                      buildAddress(Natural_list, 0),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(left:40.0,right: 40),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                color: YellowColor.withOpacity(.7), width:2,

                                              )
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.calendar_month,size: 20,color: YellowColor ,),
                                            const SizedBox(width:5),
                                             buildDayWork(Natural_list, 0),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Container(
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                color: YellowColor.withOpacity(.7), width:2,

                                              )
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            const Icon(Icons.access_time_filled,size: 20,color: YellowColor ,),
                                            const SizedBox(width:5),
                                             buildDayWork(Natural_list, 0),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: buildAbout(Natural_list, 0),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              fallback: (BuildContext context) {
             return   Center(child: CircularProgressIndicator());
              }
            ),
          );
        },
        listener: (context,state){}
    );
  }
}
