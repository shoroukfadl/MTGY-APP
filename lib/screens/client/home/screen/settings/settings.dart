import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/client/home/cubit/states.dart';
import 'package:mtgy_app/screens/client/home/screen/settings/chagepassword.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import '../../cubit/cubit.dart';
import 'edit_profile_client.dart';
import 'package:flutter/cupertino.dart';



class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UHomeCubit,UHomeStates>(
      builder: ( context ,state){
        return  Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      "Settings",
                      style: GoogleFonts.aBeeZee(fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: YellowColor),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
                  buildChangePasswordRow(context, "Update password"),
                  buildDeleteAccount(context, "Delete Your Account"),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                          Icons.menu, color: YellowColor
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "MORE FEATURES",
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
                  buildQR(context, "Scan QR Codes"),
                  buildAccountOptionRow(context, "Our Website "),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //         Icons.volume_up, color: YellowColor
                  //     ),
                  //     const  Text("|",
                  //       style: TextStyle(color: YellowColor, fontSize: 35),),
                  //     const Icon(
                  //         Icons.dark_mode_rounded, color: YellowColor
                  //     ),
                  //     const SizedBox(
                  //       width: 8,
                  //     ),
                  //     Text(
                  //       "Notifications & Themes ",
                  //       style: GoogleFonts.acme(
                  //           fontSize: 18, fontWeight: FontWeight.bold,
                  //           color: Color.fromRGBO(2, 56, 89, 1.0)),
                  //     ),
                  //   ],
                  // ),
                  // const Divider(
                  //   height: 15,
                  //   thickness: 2,
                  //   color: Color.fromRGBO(2, 56, 89, 1.0),
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // buildNotificationOptionRow("New for you", true),
                  // buildNotificationOptionRow("Dark mode", false),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        side: const BorderSide(
                          color:YellowColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                      onPressed: () {
                        UHomeCubit.get(context).userSignout(context);
                      },
                      child: const Text("SIGN OUT",
                          style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 2.2,
                              color: YellowColor)),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: ( context ,state){

      },

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
  GestureDetector buildChangeInfoRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => EditProfilePage()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.acme(fontSize: 18,
                  color: BlueColor.withOpacity(0.7)),
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
                builder: (BuildContext context) => ChangePassword()));
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
        //scanQr();
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
      onTap: ()=> UHomeCubit.get(context).UDeleteAccount(
          Email:UHomeCubit.get(context).dataprofile!.data!.email!) ,

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


  // Future <void>scanQr()async{
  //   try{
  //     FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
  //       setState(() {
  //         //qrstr=value;
  //       });
  //     });
  //   }catch(e){
  //     setState(() {
  //       //qrstr='unable to read this';
  //     });
  //   }
  // }
}