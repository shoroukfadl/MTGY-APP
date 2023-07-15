import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/client_home_cubit/cubit.dart';
import '../../../../controller/client_home_cubit/states.dart';
import '../../../../services/widgets/component.dart';
import '../../../../services/widgets/constant.dart';
import '../../pay&order/cart.dart';

class ClientProfile extends StatelessWidget {

  final emailcontroller=TextEditingController();
  final usernamecontroller=TextEditingController();
  final phonecontroller=TextEditingController();
  final _formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UHomeCubit,UHomeStates>
      (
      listener:( context ,state){} ,
      builder: ( context ,state){
        var model = UHomeCubit.get(context).dataprofile;
        emailcontroller.text = model!.data!.email!;
        usernamecontroller.text =model.data!.username!;
        phonecontroller.text= model.data!.phone!;

        return  ConditionalBuilder(
          condition:UHomeCubit.get(context).dataprofile != null ,
          builder: (BuildContext context) {
            return  Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(top:120),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left :3.0,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  const SizedBox(height: 25),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                                    child: Container(
                                      width: 180,
                                      height: 40,
                                      decoration:   const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          color:  Color.fromRGBO(2, 56, 89, 1.0),
                                      ),
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Cart",style: GoogleFonts.lobster(
                                              color:WhiteColor,fontSize: 18
                                          ),),
                                          IconButton(
                                            onPressed:(){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => CartScreen()),
                                              );
                                            },
                                            icon : const Icon(Icons.shopping_cart,size: 22,),
                                            color: YellowColor,),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15,),
                          Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                const SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                                  child: defultTextFromField(
                                      controller: usernamecontroller,
                                      type: TextInputType.text,
                                      validator: (value) {
                                        bool namevalid =
                                        RegExp(r"[A-Za-z]+|\s")
                                            .hasMatch(value);
                                        if (value.isEmpty)
                                          return 'Enter username';
                                        if (!namevalid) {
                                          return 'Enter valid username';
                                        }
                                      },
                                      labeltext: "Username"
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0,right: 20),
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
                                  padding: const EdgeInsets.only(left: 20.0,right: 20),
                                  child: defultTextFromField(
                                      controller: phonecontroller,
                                      type: TextInputType.text,
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
                                SizedBox(height: 30,),
                                ConditionalBuilder(
                                  condition: UHomeCubit.get(context).dataprofile != null ,
                                  builder: (BuildContext context) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if(_formkey.currentState!.validate())
                                        {
                                          {
                                            UHomeCubit.get(context).editClientProfile(
                                                email: emailcontroller.text   ,
                                                username: usernamecontroller.text ,
                                                phone: phonecontroller.text
                                            );
                                            model.data!.email = emailcontroller.text;
                                            model.data!.username =usernamecontroller.text;
                                            model.data!.phone = phonecontroller.text;
                                          }
                                          // model.data!.email = emailcontroller.text;
                                         // model.data!.servicename =servicenamecontroller.text;
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
                        ],
                      ),
                    ),
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
