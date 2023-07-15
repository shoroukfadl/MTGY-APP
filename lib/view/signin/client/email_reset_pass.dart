import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/signin_cubit/cubit.dart';
import '../../../controller/signin_cubit/states.dart';
import '../../../services/network/chache_helper.dart';
import '../../../services/widgets/component.dart';
import '../../../services/widgets/constant.dart';
import 'code_verif.dart';
import 'creset_password.dart';

class EmailResetPassword  extends StatelessWidget {
   EmailResetPassword ({Key? key}) : super(key: key);

  final emailcontroller=TextEditingController();
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
                    SizedBox(height: 30,),
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
                    defultTextFromField(
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
                     const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding:const EdgeInsets.symmetric(horizontal: 30),
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
                        ConditionalBuilder(
                          condition: state is! UForgetPassLoadingState ,
                          builder: (BuildContext context) {
                            return  ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  MTGYAppSignInCubit.get(context).UforgetPassword(
                                      email: emailcontroller.text);
                                }
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
                           return Center(child: CircularProgressIndicator());
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }, listener: (BuildContext context, state) {
            if(state is UForgetPassSuccessState)
              {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                    (context)=>Verifycode()), (route) => false);
              }
        },
        ),
      ),
    );
  }

}
