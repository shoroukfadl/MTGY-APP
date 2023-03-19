import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/serviceprovider/home/cubit/cubit.dart';
import 'package:mtgy_app/screens/serviceprovider/home/cubit/states.dart';
import 'package:mtgy_app/screens/signup/serviceprovider_1.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import '../../../../client/home/screen/settings/chagepassword.dart';
import '../update_password/chagepassword.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>SPHomeCubit(),
      child: BlocConsumer<SPHomeCubit,SPHomeStates>(
       builder: (context,state){
         return Scaffold(
           body: SafeArea(
             child: Container(
               padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
               child: ListView(
                 children: [
                   Text(
                     "Settings",
                     style: GoogleFonts.aBeeZee(fontSize: 25,
                         fontWeight: FontWeight.w500,
                         color: YellowColor),
                   ),
                   const SizedBox(
                     height: 40,
                   ),
                   Row(
                     children: [
                       const Icon(
                           Icons.person, color: YellowColor
                       ),
                       const SizedBox(
                         width: 8,
                       ),
                       Text(
                         "Account",
                         style: GoogleFonts.acme(fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Color.fromRGBO(2, 56, 89, 1.0)),
                       ),
                     ],
                   ),
                   const Divider(
                     height: 15,
                     thickness: 2,
                     color: Color.fromRGBO(2, 56, 89, 1.0),
                   ),
                   const SizedBox(
                     height: 10,
                   ),
                   buildChangePasswordRow(context, "Change password"),
                   buildDeleteAccount(context, "Delete Your Account"),
                   buildQR(context, "Scan QR Codes"),
                   const SizedBox(
                     height: 40,
                   ),
                   Center(
                     child: OutlinedButton(
                       style: OutlinedButton.styleFrom(
                         padding: const EdgeInsets.symmetric(horizontal: 40),
                         shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20)),
                         side: const BorderSide(
                           color:BlueColor,
                           style: BorderStyle.solid,
                         ),
                       ),
                       onPressed: () {
                         SPHomeCubit.get(context).SPSignout(context);
                       },
                       child: const Text("SIGN OUT",
                           style: TextStyle(
                               fontSize: 16,
                               letterSpacing: 2.2,
                               color: Color.fromRGBO(2, 56, 89, 1.0))),
                     ),
                   )
                 ],
               ),
             ),
           ),
         );
       },
        listener: (context,state){
         if(state is SPDeleteSuccessState)
           {
             Fluttertoast.showToast(
                 msg: "Account Deleted Successfully ",
                 toastLength: Toast.LENGTH_LONG,
                 gravity: ToastGravity.SNACKBAR,
                 timeInSecForIosWeb: 3,
                 backgroundColor: YellowColor,
                 textColor: Colors.white,
                 fontSize: 13.0
             ).then((value) => {
             Navigator.of(context).pushAndRemoveUntil(
             MaterialPageRoute(builder: (context)=> ServiceProviderSignUp()),
             (route) => false)
             });
           }
       },
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.acme(fontSize: 18,
              color: Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.7)),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: YellowColor,
              trackColor: Color.fromRGBO(2, 56, 89, 1.0),
              value: isActive,
              onChanged: (bool val) {

              },
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title,
                  style: GoogleFonts.acme(fontSize: 18,
                      color: BlueColor.withOpacity(
                          0.7)),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("GO TO website", style: GoogleFonts.acme(fontSize: 18,
                        color: BlueColor),
                    ),
                    Text("Link", style: GoogleFonts.acme(fontSize: 18,
                        color: BlueColor),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close",
                        style: GoogleFonts.acme(fontSize: 18,
                            color: BlueColor
                                .withOpacity(0.7)),
                      )),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.acme(fontSize: 18,
                  color: Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.7)),
            ),
            const Icon(
              Icons.arrow_forward,
              color: YellowColor,
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildChangePasswordRow(BuildContext context, String title) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => SPChangePassword()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.acme(fontSize: 18,
                    color: Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.7)),
              ),
              const Icon(
                Icons.arrow_forward,
                color: YellowColor,
              ),
            ],
          ),
        ),
      );
    }
  GestureDetector buildQR(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        scanQr();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.acme(fontSize: 18,
                  color: Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.7)),
            ),
            const Icon(
              Icons.arrow_forward,
              color: YellowColor,
            ),
          ],
        ),
      ),
    );
  }
  GestureDetector buildDeleteAccount(BuildContext context, String title) {
    return GestureDetector(
      onTap: () =>SPHomeCubit.get(context).SPDeleteAccount(
           Email:SPDeleteEmail!
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.acme(fontSize: 18,
                  color: Color.fromRGBO(2, 56, 89, 1.0).withOpacity(0.7)),
            ),
            const Icon(
              Icons.arrow_forward,
              color: YellowColor,
            ),
          ],
        ),
      ),
    );
  }


  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        // setState(() {
        //   //qrstr=value;
        // });
      });
    }catch(e){
      // setState(() {
      //   //qrstr='unable to read this';
      // });
    }
  }
}