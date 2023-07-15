import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/client_home_cubit/cubit.dart';
import '../../../../controller/client_home_cubit/states.dart';
import '../../../../services/widgets/component.dart';
import '../../../../services/widgets/constant.dart';
import '../../../signin/client/cilent_signin.dart';



class ChangePassword  extends StatelessWidget {
   ChangePassword ({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final oldpasscontroller=TextEditingController();
  final newpasscontroller=TextEditingController();
  final newconfirmpasscontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UHomeCubit(),
      child: BlocConsumer<UHomeCubit,UHomeStates>(
         listener: ( context, state) {
             if(state is UUpdatePasswordSuccessState)
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
                builder: (context)=>ClientSignIn2()
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
                                UHomeCubit.get(context).changeoldpasswordicon();
                              },
                              labeltext: "Old Password",
                              passtoggle: UHomeCubit.get(context).UChangepasstoggle1
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
                                UHomeCubit.get(context).changenewpasswordicon();
                              },
                              labeltext: "New Password",
                              passtoggle:UHomeCubit.get(context).UChangepasstoggle2

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
                                UHomeCubit.get(context).changeconpasswordicon();
                              },
                              labeltext: "Confirm Password",
                              passtoggle:UHomeCubit.get(context).UChangepasstoggle3

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
                                    UHomeCubit.get(context).UUpdatePassword(
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
