import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import 'dashboard.dart';

List<String> list = <String>['Hotel', 'Restaurant & Cafe', 'Bazaar',
  "Cinema","Tourism Company","Transport company","Village & Resort"];
class CreateNewPost extends StatefulWidget {
  const CreateNewPost({Key? key}) : super(key: key);

  @override
  State<CreateNewPost> createState() => _CreateNewPostState();
}

class _CreateNewPostState extends State<CreateNewPost> {
   String dropdownValue = list.first;
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: WhiteColor,
      appBar: AppBar(
        elevation: 0,

        automaticallyImplyLeading: false,
        backgroundColor: WhiteColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Center(
            child: Text("ADD NEW OFFER",style: GoogleFonts.acme(
                color: YellowColor,fontSize: 20
            ),),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 30,top: 30),
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 10,),
                  Text("ADD OFFER'S TITLE",style: GoogleFonts.acme(
                      color: BlueColor,fontSize: 17
                  ),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _titleController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Enter Title';
                      else
                        return null;
                    },
                    cursorColor:  YellowColor ,
                    decoration: InputDecoration(
                      hintText: "TITLE",
                      hintStyle: GoogleFonts.acme(textStyle: TextStyle(color: YellowColor.withOpacity(0.6),fontSize: 13)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color:YellowColor,

                          )
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),

                    ),
                  ),

                  const SizedBox(height: 20,),
                  Text("ADD OFFER'S CONTENT",style: GoogleFonts.acme(
                      color: BlueColor,fontSize: 17
                  ),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _contentController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Enter Content';
                      else if(value.length>200)
                        {
                          return "To Much Content";
                        }
                      else
                        return null;
                    },
                    cursorColor:  YellowColor ,
                    decoration: InputDecoration(
                      hintText: "Content",
                      hintStyle: GoogleFonts.acme(textStyle: TextStyle(color: YellowColor.withOpacity(0.6),fontSize: 13)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color:YellowColor,

                          )
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),

                    ),
                  ),

                  const SizedBox(height: 20,),
                  Text("ADD PRICE FOR ONE PERSON",style: GoogleFonts.acme(
                      color: BlueColor,fontSize: 17
                  ),),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty)
                        return 'Enter Price';
                      else
                        return null;
                    },
                    cursorColor:  YellowColor ,
                    decoration: InputDecoration(
                      hintText: "price",
                      hintStyle: GoogleFonts.acme(textStyle: TextStyle(color: YellowColor.withOpacity(0.6),fontSize: 13)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color:YellowColor,

                          )
                      ),
                      focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),
                      focusedErrorBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: YellowColor,

                          )
                      ),

                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text("ADD OFFER TO ",style: GoogleFonts.acme(
                      color: BlueColor,fontSize: 17
                  ),),
                  const SizedBox(height: 10,),
                  Container(
                      padding: EdgeInsets.only(left: 13,right: 10,top: 15,bottom: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                            color: YellowColor, width: 0.80),
                      ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          value: dropdownValue,
                          icon: const Icon(Icons.business_sharp),
                          elevation: 16,
                          isExpanded: true,
                          isDense: true,
                          underline: null,
                          focusColor: YellowColor,
                          style: GoogleFonts.acme(textStyle: TextStyle(color: YellowColor.withOpacity(0.6),fontSize: 13)),
                          borderRadius: BorderRadius.circular(40),
                          onChanged: (String? value) {
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0,right: 30),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:  BlueColor,
                          fixedSize: const Size.fromWidth(200),
                          shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("UPLOAD IMAGE ",style: GoogleFonts.acme(
                              color: YellowColor,fontSize: 20
                          ),),
                          const SizedBox(width: 10,),
                          const Icon(
                              Icons.upload,size: 20,
                              color: YellowColor
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(

                        style: OutlinedButton.styleFrom(
                          padding:const EdgeInsets.symmetric(horizontal: 50),
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
                      ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate())
                            {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const WaitingOffers(),
                                ),
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
                          "SAVE",
                          style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 2.2,
                              color: WhiteColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}


