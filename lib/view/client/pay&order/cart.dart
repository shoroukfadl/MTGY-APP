import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/client_home_cubit/cubit.dart';
import '../../../controller/client_home_cubit/states.dart';
import '../../../services/widgets/component.dart';
import '../../../services/widgets/constant.dart';
import 'components/chart_card.dart';
import 'components/checkout_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => UHomeCubit(),
       child:BlocConsumer<UHomeCubit,UHomeStates>(
          builder: (context,state){
            return  Scaffold(
              appBar: AppBar(
                backgroundColor: Transparent,
                elevation: 0,
                toolbarHeight: 80,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defultbackbutton(context),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text(
                            "Your Cart".toUpperCase(),
                            style: GoogleFonts.acme(color: YellowColor,
                                fontSize: 20
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                              "${getcart_list.length} items",
                              style: GoogleFonts.acme(
                                  color: YellowColor,
                                  fontSize: 13
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              body:Padding(
                padding:
                EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                  itemCount: getcart_list.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(getcart_list[index].userid.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        UHomeCubit.get(context).removecart(index);
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: WhiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Spacer(),
                      ),
                      child: CartCard(cart: getcart_list[index]),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: CheckoutCard(),
            );
          },
           listener: (context,state){
           }

    ));
  }


}
