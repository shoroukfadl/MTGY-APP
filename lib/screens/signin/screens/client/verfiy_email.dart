import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/signin/cubit/cubit.dart';
import 'package:mtgy_app/screens/signin/cubit/states.dart';
import 'package:mtgy_app/screens/signin/screens/client/cilent_signin.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../../../shared/widgets/constants.dart';
import 'code_verif.dart';

class VerfiyEmail extends StatelessWidget {
   VerfiyEmail({Key? key}) : super(key: key);
  final emailcontroller=TextEditingController();
   final _formkey = GlobalKey<FormState>();

   @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context) => MTGYAppSignInCubit(),
      child: BlocConsumer<MTGYAppSignInCubit,MTGYSignInAppStates>(
        builder: (context,state){
        return  Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: YellowColor,
                  maxRadius: 120,
                  child:  Image.asset("assets/icons/email_icon.png",
                    color: WhiteColor,
                    width: 150,
                    height: 130,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const  Center(
                  child: Text("ENTER EMAIL TO VERFIY",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(2, 56, 89, 1.0))),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: defultTextFromField(
                        controller: emailcontroller,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          bool emailvalid=
                          RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
                          if (value.isEmpty)
                            return 'Enter Email';
                          if(!emailvalid)
                          {
                            return 'Enter valid Email';
                          }
                        }
                        , labeltext: "Email"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("CHECK YOUR EMAIL",style: GoogleFonts.acme(
                    color: BlueColor,
                    fontSize: 20
                ),),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0,right: 25),
                  child: Text("In The Next Few Minutes You Will Receive An Email    ",
                    style: GoogleFonts.acme(
                        color: YellowColor.withOpacity(0.7),
                        fontSize: 15
                    ),),
                ),
                Text("To Reset Your Account Password ",
                  style: GoogleFonts.acme(
                      color: YellowColor.withOpacity(0.7),
                      fontSize: 15
                  ),),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Open your  ",
                          style: GoogleFonts.acme(
                              color: BlueColor.withOpacity(0.7),
                              fontSize: 15
                          ),),
                        Icon(Icons.email_outlined,color: BlueColor,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Copy The   ",
                          style: GoogleFonts.acme(
                              color: BlueColor.withOpacity(0.7),
                              fontSize: 15
                          ),),
                        Icon(Icons.code,color: BlueColor,)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("  Go back to the  ",
                      style: GoogleFonts.acme(
                          color: BlueColor.withOpacity(0.7),
                          fontSize: 15
                      ),),
                    Icon(Icons.app_shortcut_outlined,color: BlueColor,),
                    SizedBox(width: 8,),
                    Text(" and Paste Code in Next Page  ",
                      style: GoogleFonts.acme(
                          color: BlueColor.withOpacity(0.7),
                          fontSize: 15
                      ),),
                  ],
                ), SizedBox(height: 20,),
                ConditionalBuilder(
                  condition: state is! UForgetPassLoadingState,
                  builder: (BuildContext context) {
                    return  ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          MTGYAppSignInCubit.get(context).UforgetPassword(
                              email: emailcontroller.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  YellowColor,
                          fixedSize: const Size.fromWidth(250),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(20)))
                      ),
                      child: const Padding(
                        padding:  EdgeInsets.only(left: 50,right: 50,top: 10,bottom: 10),
                        child:  Center(
                          child: Text(
                            "CONTINUE",
                            style: TextStyle(
                                color: WhiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  },
                  fallback: (BuildContext context) {
                    return Center(child: CircularProgressIndicator(),);
                  },
                )
              ],
            ),
          );
        },

        listener: (context,state){
          if(state is UForgetPassSuccessState){
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context)=>
                Verifycode()), (route) => false);

        }
        },
      ),
        );
  }
}
