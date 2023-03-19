import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/signin/screens/serviceprovider/serviceprovider_signin.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../../../../shared/widgets/constants.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
class SPChangePassword  extends StatelessWidget {
  SPChangePassword ({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final oldpasscontroller = TextEditingController();
  final newpasscontroller = TextEditingController();
  final newconfirmpasscontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SPHomeCubit(),
      child: BlocConsumer<SPHomeCubit,SPHomeStates>(
          listener: ( context, state) {
            if(state is SPUpdatePasswordSuccessState)
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
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context)=>ServiceProviderSignIn()
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
                    fontSize: 16.0
                );
              }
            }
          },
          builder:(context,state){
            return  Scaffold(
              body: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                        backgroundColor: BlueColor,
                        maxRadius: 90,
                        child:  Image.asset("assets/icons/icons8-show-password-80.png",
                          color: WhiteColor,
                          width: 170,
                          height: 140,
                        )),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text("UPDATE PASSWORD",
                            style: GoogleFonts.acme(color: YellowColor, fontSize: 20),),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20),
                            child: defultpassTextFromField(
                                controller: oldpasscontroller,
                                ontap: () {
                                  SPHomeCubit.get(context).changeoldpasswordicon();
                                },
                                labeltext: "Old Password",
                                passtoggle: SPHomeCubit.get(context).SPChangepasstoggle1
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20),
                            child: defultpassTextFromField(
                                controller: newpasscontroller,
                                ontap: () {
                                  SPHomeCubit.get(context).changenewpasswordicon();
                                },
                                labeltext: "New Password",
                                passtoggle:SPHomeCubit.get(context).SPChangepasstoggle2

                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20),
                            child: defultpassTextFromField(
                                controller: newconfirmpasscontroller,
                                ontap: () {
                                  SPHomeCubit.get(context).changeconpasswordicon();
                                },
                                labeltext: "Confirm Password",
                                passtoggle:SPHomeCubit.get(context).SPChangepasstoggle3

                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  side: const BorderSide(
                                    color: BlueColor,
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
                                        color: BlueColor)),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    SPHomeCubit.get(context).SPupdatePassword(
                                        oldpasss: oldpasscontroller.text,
                                        newpass: newpasscontroller.text,
                                        confirmnewpass: newconfirmpasscontroller.text
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            );
          }
      ),
    );

  }
}

