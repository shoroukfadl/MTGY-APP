import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/network/chache_helper.dart';
import '../../services/widgets/component.dart';
import '../../services/widgets/constant.dart';
import '../signin/client/cilent_signin.dart';



class Client extends StatelessWidget {
  const Client({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.only( top:40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 250,
                          height: 210,
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
                        child: Image.asset("assets/images/Logo_final.png",width: 200,height: 170,),
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
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    submit(context);
                  },
                  child: Stack(
                    alignment:Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color:  YellowColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text(
                              "NEW CLIENT",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle( fontSize: 15,
                                    color: WhiteColor,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                          const SizedBox(width: 10,),
                          const Padding(
                            padding:  EdgeInsets.only(bottom: 5.0),
                            child: Center(
                              child: Icon(Icons.person_add_alt_1,
                                  color: WhiteColor,
                                  size: 25
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    CacheHelper.saveData(key: "CWelocme", value: true).then((value) {
                      if(value){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ClientSignIn2()),
                        );
                      }
                    });

                  },
                  child: Stack(
                    alignment:Alignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color:  BlueColor,

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "SIGN IN",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle( fontSize: 15,
                                    color: WhiteColor,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                          const SizedBox(width: 10,),
                          const   Padding(
                            padding:  EdgeInsets.only(bottom: 5.0),
                            child: Center(
                              child:
                              Icon(Icons.login,
                                  color: WhiteColor,
                                  size: 25
                              ),
                            ),
                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}