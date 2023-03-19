import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/client/home/cubit/cubit.dart';
import 'package:mtgy_app/screens/client/home/cubit/states.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import '../../../../../shared/widgets/constants.dart';

class EditProfilePage extends StatelessWidget {
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
  return BlocConsumer<UHomeCubit,UHomeStates>(
  builder: ( context, state) {
    var model = UHomeCubit.get(context).dataprofile;
    emailcontroller.text = model!.data!.email!;
    usernamecontroller.text =model.data!.username!;
    phonecontroller.text= model.data!.phone!;
    return ConditionalBuilder(
      condition:UHomeCubit.get(context).dataprofile != null,
      builder: (BuildContext context) {
        return Scaffold(
          body: Form(
            key: _formkey,
            child: ListView(
              children: [
                if (state is UEditProfileoadingState)
                  LinearProgressIndicator(),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "EDIT PROFILE",
                    style: GoogleFonts.acme(fontSize: 20,
                        color:YellowColor,letterSpacing: 2
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: CircleAvatar(
                      radius: 100,
                      backgroundColor: BlueColor,
                      child: Image.asset("assets/icons/1.png",
                        color: WhiteColor,width: 100,height: 110,)),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding:const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: const BorderSide(
                          color:BlueColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("CANCEL",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: Color.fromRGBO(2, 56, 89, 1.0))),
                    ),
                    ElevatedButton(
                      onPressed: () {
                      if(_formkey.currentState!.validate())
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
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:YellowColor,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: WhiteColor),
                      ),
                    )
                  ],
                )
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
  listener: (BuildContext context,state) {  },
  );


}

}