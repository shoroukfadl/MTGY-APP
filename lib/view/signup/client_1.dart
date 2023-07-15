import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/signup_cubit/cubit.dart';
import '../../controller/signup_cubit/states.dart';
import '../../services/widgets/component.dart';
import '../../services/widgets/constant.dart';
import '../signin/client/active_account.dart';
import '../signin/client/cilent_signin.dart';


class ClintSignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final usernamecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final confirmpasscontroller = TextEditingController();

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MTGYAppSignUpCubit(),
      child: BlocConsumer<MTGYAppSignUpCubit, MTGYSignUpAppStates>(
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
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomLeft,
                                colors: [
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
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 50, bottom: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: WhiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
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
                            height: 10,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25, top: 30),
                            child: Text(
                              "NEW CLIENT ",
                              style: TextStyle(
                                  color: Color.fromRGBO(2, 56, 89, 1.0),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                " Create Your Personal Account Now ",
                                style: GoogleFonts.aBeeZee(
                                  color: YellowColor,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                          width: 130,
                                          height: 110,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/Logo_final.png"),
                                            ),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: Form(
                                        key: _formKey,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15.0, right: 15),
                                          child: Column(
                                            children: <Widget>[
                                              //username
                                              defultTextFromField(
                                                controller:
                                                    usernamecontroller,
                                                type: TextInputType.name,
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
                                                labeltext: "Username",
                                              ),
                                             SizedBox(height: 15,),
                                            //phone number
                                              defultTextFromField(
                                                controller: phonecontroller,
                                                type: TextInputType.phone,
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
                                                labeltext: "Phone Number",
                                              ),
                                              SizedBox(height: 15,),
                                            //email
                                              defultTextFromField(
                                                controller: emailcontroller,
                                                type: TextInputType
                                                    .emailAddress,
                                                validator: (value) {
                                                  bool emailvalid = RegExp(
                                                          r'^[^@]+@[^@]+\.[^@]+')
                                                      .hasMatch(value);
                                                  if (value.isEmpty)
                                                    return 'Enter Email';
                                                  if (!emailvalid) {
                                                    return 'Enter valid Email';
                                                  }
                                                },
                                                labeltext: "Email Address",
                                              ),
                                              SizedBox(height: 15,),
                                              // password
                                              defultpassTextFromField(
                                                  controller: passcontroller,
                                                  ontap: () {
                                                    MTGYAppSignUpCubit.get(context).Signinchangepasswordicon();
                                                  },
                                                  labeltext: "Password",
                                                  passtoggle:
                                                  MTGYAppSignUpCubit.get(context).USignUppasstoggle1),
                                              SizedBox(height: 15,),
                                             // confirm password
                                              defultpassTextFromField(
                                                  controller:
                                                      confirmpasscontroller,
                                                  ontap: () {
                                                    MTGYAppSignUpCubit.get(context)
                                                        .SigninchangeConfirmpasswordicon();
                                                  },
                                                  labeltext:
                                                      "Confirm Password",
                                                  passtoggle:
                                                  MTGYAppSignUpCubit.get(context).USignUppasstoggle2),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! USignUpLoadingState,
                                      builder: (BuildContext context) {
                                        return  ElevatedButton(
                                          onPressed: () {
                                            // print("${emailcontroller.text} , ${passcontroller.text}  ");
                                            if ( _formKey.currentState!.validate() ) {
                                              MTGYAppSignUpCubit.get(context).clientSignup(
                                                  email: emailcontroller.text,
                                                  username: usernamecontroller.text,
                                                  phone: phonecontroller.text,
                                                  password: passcontroller.text,
                                                  confirmpassword:confirmpasscontroller.text ,
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:  BlueColor,
                                              fixedSize: const Size.fromWidth(180),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20)))
                                          ),
                                          child: const Padding(
                                            padding:  EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                                            child:  Center(
                                              child: Text(
                                                "SIGN UP",
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
                                    const SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Center(
                                          child: Text(
                                            "Already have an account?",
                                            style: TextStyle(
                                                color: BlueColor,
                                                fontSize: 15),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    ClientSignIn2(),
                                              ),
                                            );
                                          },
                                          child: const Center(
                                            child: Text(
                                              "Sign In",
                                              style: TextStyle(
                                                  color: YellowColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17),
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
          );
        },
        listener: (BuildContext context, state) {
          if(state is USignUpSuccessState)
          {
            if(state.model.status!)
            {

             Fluttertoast.showToast(
                        msg: "verfiy your email",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: YellowColor,
                        textColor: Colors.white,
                        fontSize: 13.0
                    ).then((value){
                      print("yes");
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context)=> CActivateAccount()
                          ), (route) => false);
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
                  fontSize: 13.0
              );
            }
          }
        },
      ),
    );
  }
}
