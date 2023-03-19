import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/widgets/constant.dart';
import '../../../../../shared/widgets/constants.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class ServiceProviderAccount extends StatelessWidget {
   ServiceProviderAccount({Key? key}) : super(key: key);
    final _formkey = GlobalKey<FormState>();
    final emailcontroller=TextEditingController();
    final servicenamecontroller=TextEditingController();
    final phonecontroller=TextEditingController();
    final addresscontroller=TextEditingController();

    @override
    Widget build(BuildContext context) {
      return BlocConsumer<SPHomeCubit,SPHomeStates>
        (
        listener:( context ,state){} ,
        builder: ( context ,state){
           var model = SPHomeCubit.get(context).dataprofile;
             emailcontroller.text = model!.data!.email!;
            servicenamecontroller.text =model.data!.servicename!;
            phonecontroller.text= model.data!.phone!;
           addresscontroller.text = model.data!.address!;
          return  ConditionalBuilder(
            condition:SPHomeCubit.get(context).dataprofile != null ,
            builder: (BuildContext context) {
              return  Scaffold(
                  body: Form(
                    key: _formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (state is SPEditProfileoadingState)
                          LinearProgressIndicator(),
                        const SizedBox(height: 100,),

                        Center(
                          child: Text(
                            "YOUR PROFILE",
                            style: GoogleFonts.acme(fontSize: 20,
                                color:YellowColor,letterSpacing: 2
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 180,
                              height: 180,
                              decoration: const BoxDecoration(
                                  color:YellowColor,
                                  shape: BoxShape.circle

                              ),
                            ),
                            Image.asset("assets/icons/icon_proflie.png",
                              color: WhiteColor,width: 150,height: 120
                              ,)
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: defultTextFromField(
                              controller: servicenamecontroller,
                              type: TextInputType.text,
                              validator: (value) {
                                bool namevalid =
                                RegExp(r"[A-Za-z]+|\s")
                                    .hasMatch(value);
                                if (value.isEmpty)
                                  return 'Enter servicename';
                                if (!namevalid) {
                                  return 'Enter valid servicename';
                                }
                              },
                              labeltext: "ServiceName"
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: defultTextFromField(
                              controller: emailcontroller,
                              type: TextInputType.emailAddress,
                              validator:  ( value) {
                                bool emailvalid=
                                RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
                                if (value.isEmpty)
                                  return 'Enter Email';
                                if(!emailvalid)
                                {
                                  return 'Enter valid Email';
                                }
                              },
                              labeltext: "Email"
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: defultTextFromField(
                              controller: phonecontroller,
                              type: TextInputType.number,
                              validator: (value) {
                                bool phonevalid =
                                RegExp(r"[0-9]+")
                                    .hasMatch(value!);
                                if (value.isEmpty)
                                  return 'Enter phone number';
                                if (!phonevalid) {
                                  return 'Enter valid phone number';
                                } else if (phonecontroller
                                    .text.length !=
                                    11) {
                                  return "phone number should be 11 number";
                                }
                              },
                              labeltext: "Phone Number"
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0,right: 30),
                          child: defultTextFromField(
                              controller: addresscontroller,
                              type: TextInputType.streetAddress,
                              validator:(value) {
                                bool addresvalid =
                                RegExp(r"[A-Za-z]+|\s")
                                    .hasMatch(value);
                                if (value.isEmpty)
                                  return 'Enter address';
                                if (!addresvalid) {
                                  return 'Enter valid address';
                                }
                              },
                              labeltext: "Address"
                          ),
                        ),
                        SizedBox(height: 20,),
                        ConditionalBuilder(
                          condition: SPHomeCubit.get(context).dataprofile != null ,
                          builder: (BuildContext context) {
                            return ElevatedButton(
                              onPressed: () {
                                if(_formkey.currentState!.validate())
                                {
                                  SPHomeCubit.get(context).editSPProfile(
                                      email: emailcontroller.text   ,
                                      username: servicenamecontroller.text ,
                                      phone: phonecontroller.text
                                  );
                                  // model.data!.email = emailcontroller.text;
                                  model.data!.servicename =servicenamecontroller.text;
                                  // model.data!.phone = phonecontroller.text;
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:YellowColor,
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              child: const Text(
                                "UPDATE ",
                                style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 2.2,
                                    color: WhiteColor),
                              ),
                            );
                          },
                          fallback: (BuildContext context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ],
                    ),
                  ),
              );
            },
            fallback: (BuildContext context) {
              return const Center(child:  CircularProgressIndicator());
            },
          );
        },
      );
    }

}
