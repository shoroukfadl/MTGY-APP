import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/search_cubit/cubit.dart';
import '../../../controller/search_cubit/states.dart';
import '../../../services/widgets/component.dart';
import '../../../services/widgets/constant.dart';


class Search extends StatelessWidget {
   Search({Key? key}) : super(key: key);
    final servicecontroller = TextEditingController();
   final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context) => USearchCubit(),
      child: BlocConsumer<USearchCubit,USearchStates>(
        builder: (context , state){
          return Scaffold(
            body: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
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
                              ]), //icon inside button,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: YellowColor,
                              size: 20,
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
                          padding: const EdgeInsets.only(right: 10, top: 40),
                          child: Form(
                            key: _formkey,
                            child: Stack(
                                children:[
                                  defultTextFromField(
                                      controller: servicecontroller,
                                      type: TextInputType.text,
                                      validator: (value){
                                        bool namevalid =
                                        RegExp(r"[A-Za-z]+|\s").hasMatch(value);
                                        if (value.isEmpty)
                                          return 'Enter Partner';

                                      },
                                      labeltext: "Search With Partner Name"),
                                  SizedBox(width: 30,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:230 ),
                                    child: IconButton(onPressed: (){
                                      if(_formkey.currentState!.validate()){
                                        USearchCubit.get(context).
                                        USearch(
                                            servicename: servicecontroller.text
                                        );
                                      }
                                    }, icon: Icon(Icons.search,color: BlueColor,size: 30,)),
                                  )
                                ]
                            ),
                          ),

                        )
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child:ConditionalBuilder(
                    condition: state is USearchSuccessState,
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Container(
                              width: 320,
                              decoration:const BoxDecoration(
                                boxShadow:  [
                                  BoxShadow(
                                      color: BlueColor,
                                      spreadRadius: 2,
                                      offset: Offset(0, 3),
                                      blurRadius: 4)
                                ],
                                color: WhiteColor,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)
                                ),
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Column(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              USearchCubit.get(context).searchmodel!.data!.servicename!.toUpperCase(),
                                              style: GoogleFonts.actor(textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 15,color: YellowColor,
                                              )),
                                            ),
                                            const SizedBox(width: 10,),
                                            Text(
                                              USearchCubit.get(context).searchmodel!.data!.offerTitle!.toUpperCase(),
                                              style: GoogleFonts.actor(textStyle: const TextStyle(
                                                fontWeight: FontWeight.bold,fontSize: 15,color: YellowColor,
                                              )),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Column(
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
                                                USearchCubit.get(context).searchmodel!.data!.price!.toString(),
                                                style: GoogleFonts.aBeeZee(textStyle: const TextStyle
                                                  (fontSize: 15,color: BlueColor,
                                                )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Column(
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
                                                padding: const EdgeInsets.only(left:20.0,right: 20),
                                                             child: Text(
                                                USearchCubit.get(context).searchmodel!.data!.postDetails!,
                                                style: GoogleFonts.actor(textStyle:  TextStyle(
                                                  fontSize: 15,color: BlueColor,)),
                                                maxLines: 5,
                                              ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),

                                  ],
                                ),
                              )
                          ),
                          SizedBox(height: 50,)
                        ],
                      );
                    },
                    fallback: (BuildContext context) {
                      return Center();
                    },

                  )
                ),
              ],
            ),
          );
        },
        listener: (context , state){

        },
      ),
    );
  }
}
