import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/service_provider_account.dart';
import 'package:mtgy_app/view/client/pay&order/cart.dart';

import '../../../../../../controller/client_home_cubit/cubit.dart';
import '../../../../../../controller/client_home_cubit/states.dart';
import '../../../../../../services/widgets/component.dart';
import '../../../../../../services/widgets/constant.dart';
import '../../../../pay&order/pay.dart';

class Cinemas extends StatelessWidget {
  int ind = 0;
  final countercontroller = TextEditingController();

  Cinemas({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      UHomeCubit()
        ..GetCinemaData(),
      child: BlocConsumer<UHomeCubit, UHomeStates>(
        builder: (BuildContext context, state) {
          return ConditionalBuilder(
            condition: cinama_list.isNotEmpty ,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Column(
                  children:
                  List.generate(
                      cinama_list.length,
                          (index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, left: 10, right: 10),
                          child: Container(
                              height: 550,
                              decoration: const BoxDecoration(
                                color: WhiteColor,
                                shape: BoxShape.rectangle,
                                boxShadow: [
                                  BoxShadow(
                                    color: BlueColor,
                                    offset: Offset(0, 3),
                                    blurRadius: 4.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  bottomLeft: Radius.circular(30),


                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          UHomeCubit.get(context)
                                              .GetSPProfileForClient(
                                              id: cinama_list[index].spid!)
                                      ,
                                      child: Text(
                                        cinama_list[index].serviceName!,
                                        style: GoogleFonts.acme(
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: BlueColor),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, right: 10),
                                      child: SizedBox(
                                        height: 200,
                                        width: double.infinity,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/hotel.jpg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceAround,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(width: 10,),
                                              Center(
                                                child: Text(
                                                  cinama_list[index].title!,
                                                  style: GoogleFonts.acme(
                                                      textStyle: const TextStyle(
                                                        fontWeight: FontWeight
                                                            .bold,
                                                        fontSize: 17,
                                                        color: YellowColor,
                                                      )),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceAround,
                                                children: [
                                                  const SizedBox(width: 10,),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .spaceAround,
                                                    children: [
                                                      Text(
                                                        "Price:",
                                                        style: GoogleFonts.acme(
                                                            textStyle: const TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              fontSize: 17,
                                                              color: YellowColor,
                                                            )),
                                                      ),
                                                      Text(
                                                        "${cinama_list[index]
                                                            .price!}",
                                                        style: GoogleFonts
                                                            .aBeeZee(
                                                            textStyle: const TextStyle(
                                                              fontWeight: FontWeight
                                                                  .bold,
                                                              fontSize: 15,
                                                              color: BlueColor,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 40,),
                                                  SizedBox(
                                                    width: 80,
                                                    height: 40,
                                                    child: defultTextFromField(
                                                      controller: countercontroller,
                                                      type: TextInputType
                                                          .number,
                                                      validator: (value) {
                                                        if (value.isEmpty)
                                                          return 'Enter value';
                                                      },
                                                      labeltext: "People",
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30.0, right: 20),
                                      child: Text(
                                        cinama_list[index].detail!,
                                        style: GoogleFonts.aBeeZee(
                                            textStyle: TextStyle(
                                              fontSize: 14,
                                              color: BlueColor.withOpacity(
                                                  0.8),)),
                                        maxLines: 5,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        const SizedBox(width: 20,),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              width: 200,
                                              height: 40,
                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .only(
                                                    topLeft: Radius.circular(
                                                        30),
                                                    topRight: Radius.circular(
                                                        30),
                                                    bottomRight: Radius
                                                        .circular(30),
                                                    bottomLeft: Radius.circular(
                                                        30),
                                                  ),
                                                  color: BlueColor),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Paymnet()));
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: const Size(
                                                      350, 45),
                                                  shadowColor: BlueColor,
                                                  elevation: 30,
                                                  backgroundColor: BlueColor,
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text("Book now ",
                                                          style: GoogleFonts
                                                              .acme(
                                                            textStyle: const TextStyle(
                                                                fontSize: 15,
                                                                color: WhiteColor),)),
                                                      const SizedBox(width: 5,),
                                                      const Icon(
                                                        Icons.monetization_on,
                                                        color: YellowColor,
                                                        size: 17,)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20,),
                                        Text("OR",
                                            style: GoogleFonts.acme(
                                              textStyle: const TextStyle(
                                                  fontSize: 15,
                                                  color: YellowColor),)),
                                        const SizedBox(width: 20,),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              width: 200,
                                              height: 40,
                                              decoration: BoxDecoration(

                                                  borderRadius: BorderRadius
                                                      .circular(5),
                                                  color: BlueColor),
                                              child: ElevatedButton(
                                                onPressed: () =>
                                                    UHomeCubit.get(context)
                                                        .UaddtoCart(
                                                        service: cinama_list[index]
                                                            .serviceName!,
                                                        amount: int.parse(
                                                            countercontroller
                                                                .text),
                                                        price: cinama_list[index]
                                                            .price!,
                                                        id: cinama_list[index]
                                                            .id!,
                                                        image: cinama_list[index]
                                                            .image!,
                                                        category: cinama_list[index]
                                                            .category!),
                                                style: ElevatedButton.styleFrom(
                                                  fixedSize: const Size(
                                                      350, 45),
                                                  shadowColor: BlueColor,
                                                  elevation: 30,
                                                  backgroundColor: BlueColor,
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: [
                                                      Text("Add to cart",
                                                          style: GoogleFonts
                                                              .acme(
                                                            textStyle: const TextStyle(
                                                                fontSize: 15,
                                                                color: WhiteColor),)),
                                                      const SizedBox(width: 5,),
                                                      const Icon(Icons
                                                          .add_shopping_cart_rounded,
                                                        color: YellowColor,
                                                        size: 17,)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20,),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                          ),
                        );
                      }),
                ),
              );
            },
            fallback: (BuildContext context) {
              return Center(child: CircularProgressIndicator());
            },

          );
        },
        listener: (context, state) {
          if (state is UaddtocartSuccessState) {
            print(UHomeCubit
                .get(context)
                .addtocartmodel!
                .message);
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => ServicesProviderAccount()));
          }
          if (state is getSPCProfSuccessState) {
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => ServicesProviderAccount()));
            spprofilemodel2 = UHomeCubit
                .get(context)
                .spprofilemodel;
            print(spprofilemodel2!.data!.id);
          }
        },
      ),
    );
  }
}
