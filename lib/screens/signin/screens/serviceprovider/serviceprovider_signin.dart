import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/signin/cubit/cubit.dart';
import 'package:mtgy_app/screens/signin/screens/serviceprovider/active_account.dart';
import 'package:mtgy_app/screens/signin/screens/serviceprovider/email_reset_pass.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../../../shared/network/chache_helper.dart';
import '../../../../shared/widgets/constants.dart';
import '../../../serviceprovider/home/screens/home/mainhome.dart';
import '../../../signup/serviceprovider_1.dart';

import '../../cubit/states.dart';
import '../client/creset_password.dart';

class ServiceProviderSignIn extends StatelessWidget {
  ServiceProviderSignIn({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final emailcontroller=TextEditingController();
  final passcontroller=TextEditingController();

  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=> MTGYAppSignInCubit(),
      child: BlocConsumer<MTGYAppSignInCubit,MTGYSignInAppStates>(
        builder: (BuildContext context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topCenter,
                        decoration:const BoxDecoration(
                            gradient:  LinearGradient(begin: Alignment.topCenter,
                                end: Alignment.bottomLeft, colors: [
                                  BlueColor,
                                  YellowColor,
                                ])),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        color: WhiteColor,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left :30,right: 30,top: 50),
                    child: Container(
                      width: double.infinity,
                      height: 600,
                      decoration:const  BoxDecoration(
                        color: WhiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow:  [
                          BoxShadow(
                              color: Color.fromRGBO(2, 56, 89, 1.0),
                              blurRadius: 20,
                              offset: Offset(0, 10)),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left : 25,top: 20),
                            child: Text(
                              "SIGN IN  ",
                              style: TextStyle(color:Color.fromRGBO(2, 56, 89, 1.0),fontSize: 30,fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Center(
                            child:  Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                "Hi , Weclome Back",
                                style: TextStyle(color: YellowColor, fontSize: 15,),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                          width: 150,
                                          height: 130,
                                          decoration:const  BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage("assets/images/Logo_final.png"),
                                            ),
                                          )
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: <Widget>[
                                            defultTextFromField(
                                              controller: emailcontroller,
                                              type:  TextInputType.emailAddress,
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
                                              labeltext:  "Email Address",
                                            ),
                                            SizedBox(height: 20,),
                                            defultpassTextFromField(
                                                controller: passcontroller,
                                                ontap: (){
                                                  MTGYAppSignInCubit.get(context).SPSinchangepassicon();
                                                },
                                                labeltext: "Password",
                                                passtoggle: MTGYAppSignInCubit.get(context).SPSignInpasstoggle1
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                            onPressed: (){
                                              Navigator.pushAndRemoveUntil(
                                                  context, MaterialPageRoute(builder: (context)=>
                                                  SPActivateAccount()), (route) => false);
                                            },
                                            child: Text("Verify Email ? ",
                                                style: GoogleFonts.abel(
                                                    color: BlueColor,
                                                    fontWeight: FontWeight.w700
                                                )
                                            )),
                                        TextButton(onPressed: (){
                                          Navigator.pushAndRemoveUntil(context,
                                              MaterialPageRoute(builder: (context)=> SPEmailResetPassword()),(route) => false);

                                        },
                                            child: Text("Forgot Password ?",
                                                style: GoogleFonts.abel(
                                                    color: BlueColor,
                                                    fontWeight: FontWeight.w700
                                                )
                                            )),
                                      ],
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! SPSignInLoadingState,
                                      builder: (BuildContext context) {
                                        return  ElevatedButton(
                                          onPressed: () {
                                            // print("${emailcontroller.text} , ${passcontroller.text}  ");
                                            if ( _formKey.currentState!.validate() ) {
                                              MTGYAppSignInCubit.get(context).SPSignin(
                                                  email: emailcontroller.text,
                                                  password: passcontroller.text);
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:  BlueColor,
                                              fixedSize: const Size.fromWidth(300),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20)))
                                          ),
                                          child: const Padding(
                                            padding:  EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                                            child:  Center(
                                              child: Text(
                                                "SIGN IN",
                                                style: TextStyle(
                                                    color: YellowColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      fallback: (BuildContext context) {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Center(
                                          child:  Text("Don't have an account?" ,
                                            style: TextStyle(color: BlueColor, fontSize: 13),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) =>  ServiceProviderSignUp(),
                                              ),
                                            );
                                          },
                                          child: const Center(
                                            child: Text(
                                              "SIGN UP",
                                              style: TextStyle(
                                                  color: YellowColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ); },
        listener: (BuildContext context, Object? state) {
          if(state is SPSignInSuccessState)
          {
            if(state.model.status!)
            {
              Fluttertoast.showToast(
                  msg: state.model.message!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: YellowColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              ).then((value){
                CacheHelper.saveData(key: "token", value: state.model.token).then((value) {
                  token = state.model.token!;
                  print('token from savedata : $token');
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context)=>ServiceProviderMainHome()
                  ), (route) => false);
                });
              });
            }
            else if(state.model.status ==false)
            {
              Fluttertoast.showToast(
                  msg: state.model.message!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: BlueColor,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
      ),
    );

  }
}
