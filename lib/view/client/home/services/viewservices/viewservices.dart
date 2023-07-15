
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../services/widgets/constant.dart';
import '../../../../../services/widgets/counter.dart';
import '../../../../../services/widgets/discription.dart';
import '../../../pay&order/cart.dart';
import '../../../pay&order/pay.dart';
import 'offers/service_provider_account.dart';

class ViewServicesDetail extends StatelessWidget {
  const ViewServicesDetail({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.38,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 35,
                      height: 45,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: WhiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: BlueColor,
                              offset: Offset(0, 1),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ]
                      ), //icon inside button,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back, color: BlueColor, size: 20,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(
                  height: 700,
                  decoration:const BoxDecoration(
                    color: WhiteColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    ),
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesProviderAccount(),));
                          },
                          child: Container(
                            height: 60,
                            width: 300,
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                    color: BlueColor,
                                    width: 2,
                                  )
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:  CrossAxisAlignment.start,
                                children: [
                                  const  Center(
                                    child: Icon(Icons.person_outlined,size: 40,color:  YellowColor
                                      ,),
                                  ),
                                  const SizedBox(width : 20,),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Center(
                                      child: Text(
                                        "Hotel1",
                                        style: GoogleFonts.actor(textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 17,
                                            color:BlueColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height : 30,),
                        Column(
                          children: [
                            const SizedBox(height: 20,),
                            Center(
                              child: Text(
                                "العيد معانا",
                                style: GoogleFonts.actor(textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 25,color: YellowColor,
                                )),
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Padding(
                              padding: const EdgeInsets.only(left:30.0,right: 30),
                              child: Text(
                                'في العيد محتاج الروقان و الاستجمام, عشان كده وفرنالك المكان الي يساعدك علي ده بغرفه تطل علي منظر ياخدك لعالم تاني , احجز دلوقتي و استمتع بالخصم  ',
                                style: GoogleFonts.actor(textStyle:  TextStyle(
                                  fontSize: 13,color: BlueColor.withOpacity(0.8),)),
                                maxLines: 5,textDirection: TextDirection.rtl,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Price",
                                  style: GoogleFonts.actor(textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 25,color: YellowColor,
                                  )),
                                ),
                                Text(
                                  "300 EP",
                                  style: GoogleFonts.aBeeZee(textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,fontSize: 15,color: BlueColor,
                                  )),
                                ),
                              ],
                            ),
                            const ListTileItem(),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            Expanded(
                              child: Center(
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      boxShadow:const [
                                        BoxShadow(
                                          color:  BlueColor,
                                          offset: Offset(0,3),
                                          blurRadius: 4.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                      color:  BlueColor),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder:(context)=>Paymnet())
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize:const Size(350, 45),
                                      shadowColor: BlueColor ,
                                      elevation: 30,
                                      backgroundColor:  BlueColor,
                                    ),
                                    child:  Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Book now",
                                              style: GoogleFonts.acme(textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  color: WhiteColor),)),
                                          SizedBox(width: 5,),
                                          Icon(Icons.account_balance_wallet,color:YellowColor,size: 17,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Text("OR" ,style: GoogleFonts.acme(textStyle: const TextStyle(
                                fontSize: 15,
                                color: YellowColor),)),
                            SizedBox(width: 10,),
                            Expanded(
                              child: Center(
                                child: Container(
                                  width: 200,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      boxShadow:const [
                                        BoxShadow(
                                          color:  BlueColor,
                                          offset: Offset(0,3),
                                          blurRadius: 4.0,
                                          spreadRadius: 2.0,
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                      color:  BlueColor),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder:(context)=>CartScreen())
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      fixedSize:const Size(350, 45),
                                      shadowColor: BlueColor ,
                                      elevation: 30,
                                      backgroundColor:  BlueColor,
                                    ),
                                    child:  Center(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Add to cart",
                                              style: GoogleFonts.acme(textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  color: WhiteColor),)),
                                          SizedBox(width: 5,),
                                          Icon(Icons.add_shopping_cart_rounded,color:YellowColor ,size: 17,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
