import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/signin/serviceprovider/serviceprovider_signin.dart';

import '../../../controller/signin_cubit/cubit.dart';
import '../../../controller/signin_cubit/states.dart';
import '../../../services/widgets/component.dart';
import '../../../services/widgets/constant.dart';


class SPForgotPassword extends StatelessWidget {

  @override
  final _formKey = GlobalKey<FormState>();
  final passcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> MTGYAppSignInCubit(),
      child: BlocConsumer<MTGYAppSignInCubit,MTGYSignInAppStates>(
        builder: (BuildContext context, state) {
        return  Scaffold(
            body: Container(
              padding: const EdgeInsets.only(left: 16, top: 80, right: 16),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    Center(
                      child: Text("RESET  PASSWORD",
                        style: GoogleFonts.acme(color: BlueColor, fontSize: 20),),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                        backgroundColor: YellowColor,
                        maxRadius: 100,
                        child: Image.asset("assets/icons/password.png",
                          color: WhiteColor,width: 150,height: 120,)),
                    const SizedBox(
                      height: 20,
                    ),
                    defultpassTextFromField(
                        controller: passcontroller,
                        ontap: () {
                          MTGYAppSignInCubit.get(context).SPforgetchangepasswordicon();
                        },
                        labeltext: "Password",
                        passtoggle: MTGYAppSignInCubit.get(context).SPForgetpasstoggle1
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defultpassTextFromField(
                        controller: confirmpasswordcontroller,
                        ontap: () {
                          MTGYAppSignInCubit.get(context).SPforgetchangeConfirmpasswordicon();
                        },
                        labeltext: "Confirm Password",
                        passtoggle: MTGYAppSignInCubit.get(context).SPForgetpasstoggle2
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    ConditionalBuilder(
                      condition: state is! SPResetPassLoadingState,
                      builder: (BuildContext context) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              MTGYAppSignInCubit.get(context).SPresetPassword(
                                  password: passcontroller.text,
                                  confirmPassword: confirmpasswordcontroller.text
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: YellowColor,
                            padding: EdgeInsets.symmetric(horizontal: 50),
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
                        );
                      },
                      fallback: (BuildContext context) {
                        return Center(child: CircularProgressIndicator());
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {
          if(state is SPResetPassSuccessState)
            {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context)=>ServiceProviderSignIn()), (route) => false);
            }
        },
      ),
    );
  }
}