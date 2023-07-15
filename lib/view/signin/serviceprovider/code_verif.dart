import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/signin_cubit/cubit.dart';
import '../../../controller/signin_cubit/states.dart';
import '../../../services/network/chache_helper.dart';
import '../../../services/widgets/constant.dart';
import 'creset_password.dart';

class SPVerifycode  extends StatelessWidget {
  SPVerifycode ({Key? key}) : super(key: key);

  final codecontroller=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) =>MTGYAppSignInCubit(),
        child: BlocConsumer<MTGYAppSignInCubit,MTGYSignInAppStates>(
          builder: (BuildContext context, state) {
            return Container(
              padding: const EdgeInsets.only(left: 25, top: 100, right: 25,),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    CircleAvatar(
                      radius: 100,
                        backgroundColor: YellowColor,
                        child: Image.asset("assets/icons/PngItem_4037406.png",
                          width: 100,
                          height: 90,
                          color: WhiteColor,
                        )),
                    const SizedBox(height: 30,),
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
                    VerificationCode(
                      textStyle: GoogleFonts.actor(
                          fontSize: 20.0, color: YellowColor,fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      underlineColor: BlueColor,
                      length: 6,
                      underlineWidth: 5,
                      cursorColor: YellowColor,
                      underlineUnfocusedColor:BlueColor ,
                      clearAll: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'clear all',
                          style: TextStyle(fontSize: 14.0,
                              decoration: TextDecoration.underline, color: BlueColor),
                        ),
                      ),
                      onCompleted: (String value) => MTGYAppSignInCubit.get(context).SPCompeleteresetcode(value),
                      onEditing: (bool value) =>  MTGYAppSignInCubit.get(context).SPeditresetcode(value),
                       ),
                     const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is! SPVerifycodeLoadingState ,
                      builder: (BuildContext context) {
                        return  ElevatedButton(
                          onPressed: () {

                              MTGYAppSignInCubit.get(context).SPVerifyCode(
                                codereset: MTGYAppSignInCubit.get(context).SPcode!
                              );

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:YellowColor,
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text(
                            "CONTINUE",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: WhiteColor),
                          ),
                        );
                      },
                      fallback: (BuildContext context) {
                       return const Center(child: CircularProgressIndicator());
                      },
                    )
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, state) {
            if(state is SPVerifycodeSuccessState)
              {
              CacheHelper.saveData(key: "resetpasstoken", value: state.model.token).then((value) {
                resetPasstoken = state.model.token!;
                print(resetPasstoken);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                    (context)=>SPForgotPassword()), (route) => false);
              });
                  }
        },
        ),
      ),
    );
  }

}
