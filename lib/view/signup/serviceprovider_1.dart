
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/controller/signup_cubit/states.dart';
import '../../controller/signup_cubit/cubit.dart';
import '../../services/network/chache_helper.dart';
import '../../services/widgets/component.dart';
import '../../services/widgets/constant.dart';
import '../signin/serviceprovider/serviceprovider_signin.dart';
import '../signin/serviceprovider/verfiy_email.dart';


class ServiceProviderSignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final usernamecontroller=TextEditingController();
  final phonecontroller=TextEditingController();
  final passcontroller=TextEditingController();
  final addresscontroller=TextEditingController();
  final Confirmpasscontroller=TextEditingController();
  final emailcontroller= TextEditingController();


  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MTGYAppSignUpCubit(),
      child: BlocConsumer<MTGYAppSignUpCubit, MTGYSignUpAppStates>(
        builder: (BuildContext context, state) {
        return   Scaffold(
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
                    padding: const EdgeInsets.only(left :20,right: 20,top:50,bottom: 30),
                    child: Container(
                      width: double.infinity,
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
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              "NEW PARTNER ",
                              style: GoogleFonts.acme(
                                  color:Color.fromRGBO(2, 56, 89, 1.0),
                                  fontSize: 23,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child:  Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(
                                " Create Your Bussiness Account Now ",
                                style: GoogleFonts.aBeeZee(color: YellowColor, fontSize: 14,),
                              ),
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: <Widget>[
                                    Center(
                                      child: ClipOval(
                                        child: Container(
                                        padding: EdgeInsets.all(8),
                                        color: YellowColor,
                                        width: 150,
                                        height: 150,
                                        child: ClipOval(
                                          child: Material(
                                              color: Transparent,
                                              child:
                                              MTGYAppSignUpCubit.get(context).file == null ?
                                              IconButton(
                                                onPressed: () {
                                                  return  MTGYAppSignUpCubit.get(context).pickimage();
                                                },
                                                icon: Icon(Icons.add_photo_alternate_outlined,size: 50,color: WhiteColor,),

                                              ) :
                                              ClipOval(child: Image.file(MTGYAppSignUpCubit.get(context).file!))
                                          ),
                                        ),
                                        ),
                                        )
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: Form(
                                        key: _formKey,
                                        child: Column(
                                          children: <Widget>[
                                            defultTextFromField(
                                              controller: usernamecontroller,
                                              type: TextInputType.name,
                                              validator: (value) {
                                                bool namevalid=
                                                RegExp(r"[A-Za-z]+|\s").hasMatch(value);
                                                if (value.isEmpty)
                                                  return 'Enter name';
                                                if(!namevalid)
                                                {
                                                  return 'Enter valid name';
                                                }
                                              },
                                              labeltext:  "Service Name",
                                            ),
                                            const SizedBox(height: 15,),
                                            defultTextFromField(
                                              controller: phonecontroller,
                                              type:  TextInputType.phone,
                                              validator: ( value){
                                                bool phonevalid=
                                                RegExp(r"[0-9]+").hasMatch(value!);
                                                if (value.isEmpty)
                                                  return 'Enter phone number';
                                                if(!phonevalid)
                                                {
                                                  return 'Enter valid phone number';
                                                }
                                                else if (phonecontroller.text.length != 11)
                                                {
                                                  return "phone number should be 11 number";
                                                }
                                              },
                                              labeltext:  "Phone Number",
                                            ),
                                            const SizedBox(height: 15,),
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
                                            const SizedBox(height: 15,),

                                            defultpassTextFromField(
                                                controller: passcontroller,
                                                ontap: (){
                                                  MTGYAppSignUpCubit.get(context).SPSignUpchangeicon();
                                                }, labeltext: "Password",
                                                passtoggle: MTGYAppSignUpCubit.get(context).SPSignUppasstoggle1
                                            ),
                                            const SizedBox(height: 15,),
                                            defultpassTextFromField(
                                                controller: Confirmpasscontroller,
                                                ontap: (){
                                                  MTGYAppSignUpCubit.get(context).SPSignUpchangeCicon();
                                                }, labeltext: "Confirm Password",
                                                passtoggle: MTGYAppSignUpCubit.get(context).SPSignUppasstoggle2
                                            ),
                                            const SizedBox(height: 15,),
                                            Container(
                                              padding: EdgeInsets.only(left: 13,right: 10,top: 15,bottom: 15),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0),
                                                border: Border.all(
                                                    color: YellowColor, width: 0.80),
                                              ),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                    value: MTGYAppSignUpCubit.get(context).dropdownValue!,
                                                    icon: const Icon(Icons.category_sharp),
                                                    elevation: 16,
                                                    isExpanded: true,
                                                    isDense: true,
                                                    underline: null,
                                                    focusColor: YellowColor,
                                                    iconEnabledColor: YellowColor,
                                                    iconDisabledColor: BlueColor,
                                                    style: GoogleFonts.acme(textStyle: TextStyle(color: YellowColor.withOpacity(0.6),fontSize: 13)),
                                                    borderRadius: BorderRadius.circular(40),
                                                    onChanged: (String? value) => MTGYAppSignUpCubit.get(context).categorytype(value!),
                                                    items: MTGYAppSignUpCubit.list.map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList()),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height:15,
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! SPSignUpLoadingState,
                                      builder: (BuildContext context) {
                                      return  ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              MTGYAppSignUpCubit.get(context)
                                                  .SPSignup(
                                                email: emailcontroller.text,
                                                servicename: usernamecontroller
                                                    .text,
                                                phone: phonecontroller.text,
                                                password: passcontroller.text,
                                                confirmpassword: Confirmpasscontroller
                                                    .text,
                                                address: addresscontroller.text,
                                                category: MTGYAppSignUpCubit
                                                    .get(context)
                                                    .dropdownValue,
                                              );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:  BlueColor,
                                              fixedSize: const Size.fromWidth(300),
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(50)))
                                          ),
                                          child: const Padding(
                                            padding:  EdgeInsets.all(15),
                                            child:  Center(
                                              child: Text(
                                                "SIGN UP",
                                                style: TextStyle(
                                                    color: YellowColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15),
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
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Center(
                                          child:  Text("Already have an account?" ,
                                            style: TextStyle(color: BlueColor, fontSize: 15),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => ServiceProviderSignIn(),
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
                                    ),

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
          if(state is SPSignUpSuccessState)
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
              ).then((value) {
            CacheHelper.saveData(key: "SPID", value: state.model.data!.id).then((value) {
            SPID = state.model.data!.id!;
              });}).then((value){
                print("yes");
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context)=> SPVerfiyEmail()
                    ), (route) => false);
              });
            }
            else
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
