import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mtgy_app/screens/client/home/screen/main_home/client_main_home.dart';
import 'package:mtgy_app/screens/client/pay&order/cubit/cubit.dart';
import 'package:mtgy_app/screens/client/pay&order/cubit/states.dart';
import 'package:mtgy_app/screens/serviceprovider/models/dashboard.dart';
import 'package:mtgy_app/shared/widgets/constants.dart';

import '../../../shared/widgets/constant.dart';


class Paymnet extends StatelessWidget {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context)=> UOrder_PayCubit(),
      child: BlocConsumer<UOrder_PayCubit,UOrder_PayStates>(
        builder: (context , state){
        return  Scaffold(
            floatingActionButton: defultbackbutton(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
            body: Padding(
              padding: const EdgeInsets.only( top: 50.0,left: 10 ,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.zero,
                      expansionCallback: (int index, bool isExpanded) {
                       UOrder_PayCubit.get(context).VisaCard(isExpanded);
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return  ListTile(
                              title: Text('Pay with Credit Card',style: GoogleFonts.acme(
                                  color: YellowColor,fontSize: 17
                              ),),
                            );
                          },
                          body: SingleChildScrollView(
                            child: Column(
                              children: [
                                CreditCardWidget(
                                  isHolderNameVisible:true,
                                  cardNumber: UOrder_PayCubit.get(context).cardNumber,
                                  expiryDate: UOrder_PayCubit.get(context).expiryDate,
                                  cardHolderName: UOrder_PayCubit.get(context).nameoncard,
                                  cvvCode: UOrder_PayCubit.get(context).cvvCode,
                                  showBackView: UOrder_PayCubit.get(context).isCvvFocused,
                                  obscureCardNumber: true,
                                  frontCardBorder: Border.all(
                                      color: BlueColor
                                  ),
                                  backCardBorder: Border.all(
                                      color: BlueColor
                                  ),
                                  cardBgColor:BlueColor ,
                                  cardType:CardType.mastercard ,
                                  width: 450,
                                  height: 200,
                                  chipColor: YellowColor,
                                  textStyle: GoogleFonts.acme(
                                      color: WhiteColor
                                  ),
                                  obscureCardCvv: true,
                                  onCreditCardWidgetChange: (CreditCardBrand ) {  },),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0,top: 16),
                                  child: Column(
                                    children: [
                                      CreditCardForm(
                                        cardNumber: UOrder_PayCubit.get(context).cardNumber,
                                        expiryDate: UOrder_PayCubit.get(context).expiryDate,
                                        cardHolderName: UOrder_PayCubit.get(context).nameoncard,
                                        cvvCode: UOrder_PayCubit.get(context).cvvCode,
                                        onCreditCardModelChange: UOrder_PayCubit.get(context).onCreditCardModelChange,
                                        formKey: _formkey,
                                        cardNumberDecoration: InputDecoration(
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: BlueColor,
                                                    width: 1
                                                )
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: YellowColor,
                                                    width: 1
                                                )
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: BlueColor,
                                                    width: 1
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: YellowColor,
                                                    width: 1
                                                )
                                            ),
                                            labelStyle:  GoogleFonts.acme(textStyle:
                                            const TextStyle(color: YellowColor,
                                                fontSize: 13)),
                                            hintStyle:  GoogleFonts.acme(textStyle:
                                            TextStyle(color: YellowColor.withOpacity(0.6),
                                                fontSize: 13)),
                                            labelText: 'Number',
                                            hintText: 'xxxx xxxx xxxx xxxx'
                                        ),
                                        expiryDateDecoration:  InputDecoration(
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: BlueColor,
                                                    width: 1
                                                )
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: YellowColor,
                                                    width: 1
                                                )
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: BlueColor,
                                                    width: 1
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: YellowColor,
                                                    width: 1
                                                )
                                            ),
                                            labelStyle:  GoogleFonts.acme(textStyle:
                                            const TextStyle(color: YellowColor,
                                                fontSize: 13)),
                                            hintStyle:  GoogleFonts.acme(textStyle:
                                            TextStyle(color: YellowColor.withOpacity(0.6),
                                                fontSize: 13)),
                                            labelText: 'Expired Date',
                                            hintText: 'xx/xx'
                                        ),
                                        cvvCodeDecoration:  InputDecoration(
                                            focusedErrorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: BlueColor,
                                                    width: 1
                                                )
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: YellowColor,
                                                    width: 1
                                                )
                                            ),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: BlueColor,
                                                    width: 1
                                                )
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                borderSide: const BorderSide(
                                                    color: YellowColor,
                                                    width: 1
                                                )
                                            ),
                                            labelStyle:  GoogleFonts.acme(textStyle:
                                            const TextStyle(color: YellowColor,
                                                fontSize: 13)),
                                            hintStyle:  GoogleFonts.acme(textStyle:
                                            TextStyle(color: YellowColor.withOpacity(0.6),
                                                fontSize: 13)),
                                            labelText: 'CVV',
                                            hintText: 'xxx'
                                        ),
                                        cardHolderDecoration:  InputDecoration(
                                          focusedErrorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                  color: BlueColor,
                                                  width: 1
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                  color: YellowColor,
                                                  width: 1
                                              )
                                          ),
                                          errorBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                  color: BlueColor,
                                                  width: 1
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20),
                                              borderSide: const BorderSide(
                                                  color: YellowColor,
                                                  width: 1
                                              )
                                          ),
                                          labelStyle:  GoogleFonts.acme(textStyle:
                                          const TextStyle(color: YellowColor,
                                              fontSize: 13)),
                                          hintStyle:  GoogleFonts.acme(textStyle:
                                          TextStyle(color: YellowColor.withOpacity(0.6),
                                              fontSize: 13)),
                                          labelText: 'Card Holder',
                                        ), themeColor: WhiteColor,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            fixedSize: const Size(300, 40),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            backgroundColor: BlueColor

                                        ),
                                        child: Container(
                                          margin: const EdgeInsets.all(8.0),
                                          child: const Text(
                                            'PAY',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        onPressed: (){
                                          if(_formkey.currentState!.validate()){
                                            print('valid');
                                          }
                                          else{
                                            print('inValid');
                                          }
                                        },)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          isExpanded: UOrder_PayCubit.get(context).isCreditCardExpanded,
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: ExpansionPanelList(
                      elevation: 1,
                      expandedHeaderPadding: EdgeInsets.zero,
                      expansionCallback: (int index, bool isExpanded) {
                      UOrder_PayCubit.get(context).Fawry(isExpanded);
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder: (BuildContext context, bool isExpanded) {
                            return  ListTile(
                              iconColor: YellowColor,
                              title:  Text("PAY WITH FAWRY THEN UPLOAD SCREENSHOT FOR YOUR BILL",
                                style: GoogleFonts.acme(
                                    color: YellowColor,fontSize: 15
                                ),),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10,),
                                UOrder_PayCubit.get(context).file == null ?
                                Center(
                                  child: Column(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              return UOrder_PayCubit.get(context).PickerCamara();
                                            },
                                            icon: const Icon(
                                              Icons.photo_library_outlined,size: 70,color: YellowColor,
                                            )),
                                        SizedBox(height: 30,),
                                        Center(
                                          child: Text("NO Selected Image ",style: GoogleFonts.acme(
                                            fontSize: 15,color: BlueColor
                                          ),),
                                        ),
                                      ],
                                    )
                                ): SizedBox(
                                    height: 100,
                                    width: 230,
                                    child: Image.file(UOrder_PayCubit.get(context).file!)),
                                const SizedBox(
                                  height: 30,
                                ),
                                ConditionalBuilder(
                                  condition: state is! UPayLoadingState,
                                  builder: ( context) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        if(UOrder_PayCubit.get(context).imagename != null)
                                        {
                                          UOrder_PayCubit.get(context).UPay(

                                          );
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
                                        "UPLoad",
                                        style: TextStyle(
                                            fontSize: 17,
                                            letterSpacing: 2.2,
                                            color: WhiteColor),
                                      ),
                                    );
                                  },
                                  fallback: (BuildContext context) {
                                    return LinearProgressIndicator();
                                  },
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          isExpanded: UOrder_PayCubit.get(context).isFawryExpanded,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context,state){
             if(state is UPaySuccessState){
    if(state.model.status!)
    {

          Fluttertoast.showToast(
          msg: state.model.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: YellowColor,
          textColor: Colors.white,
          fontSize: 13.0
          ).then((value){
          print("yes");
          Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context)=> MainHome()
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
          }}
        },
      ),
    );
  }

}
