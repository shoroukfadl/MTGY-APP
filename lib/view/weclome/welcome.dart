import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/weclome/service_provider.dart';


import '../../services/widgets/constant.dart';
import 'client.dart';


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Card(
      color: WhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            color: WhiteColor,
            alignment: Alignment.center,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only( top:50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 300,
                          height: 260,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: WhiteColor,
                              boxShadow: [
                                BoxShadow(
                                  color:  BlueColor,
                                  offset: Offset(0,3),
                                  blurRadius: 4.0,
                                  spreadRadius: 10.0,
                                ),
                                BoxShadow(
                                  color:  YellowColor,
                                  offset: Offset(0,3),
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                ),
                              ]
                          ),
                        ),
                      ),
                      Center(child: Padding(
                        padding: const EdgeInsets.only(top: 25.0,right: 15),
                        child: Image.asset("assets/images/Logo_final.png",width: 250,height: 210,),
                      )),
                        ],
                      ),
                 const  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children:  [
                      Text(
                        "  MTGY AL FAYOUM ".toUpperCase(),
                        style: GoogleFonts.fredokaOne(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(2, 56, 89, 1.0),
                              fontSize: 25,
                              ),
                        )
                      ),
                     const  SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Service_Provider()),
                                );
                              },
                              child: Stack(
                                alignment:Alignment.center,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(30)),
                                      color:  YellowColor,
                                    ),
                                  ),
                                  Text(
                                      "PARTNER",
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle( fontSize: 20,
                                            color:WhiteColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 20,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Client()),
                                );
                              },

                              child: Stack(
                                alignment:Alignment.center,
                                children: [
                                  Container(
                                    width: 250,
                                    height: 40,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(30)),
                                        color:  BlueColor,
                                    ),
                                  ),
                                  Text(
                                      " CLIENT",
                                      style: GoogleFonts.aBeeZee(
                                        textStyle: const TextStyle( fontSize: 20,
                                            color: WhiteColor,
                                            fontWeight: FontWeight.bold
                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
