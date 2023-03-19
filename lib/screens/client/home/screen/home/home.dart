import 'package:button_navigation_bar/button_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/service_type_model.dart';

import '../../../../../shared/widgets/search.dart';
import '../../../../notification/notificationList.dart';
import '../../../chat/screens/home_screen.dart';
import '../../../newestoffers/bazaars.dart';
import '../../../newestoffers/cinemas.dart';
import '../../../newestoffers/hotels.dart';
import '../../../newestoffers/resorts&villages.dart';
import '../../../newestoffers/restaurants.dart';
import '../../../newestoffers/tourism_company.dart';
import '../../../newestoffers/transport_company.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController tabController;
  int index =0;
  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Transparent,
        toolbarHeight: 120,
        title: Padding(
          padding: const EdgeInsets.only(
              top: 70, left: 5, right: 10, bottom: 30),
          child: TextField(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Search()),
              );
            },
            cursorColor:  BlueColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2, color: BlueColor,),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2, color: BlueColor,),
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "search For Services ",
              hintStyle: GoogleFonts.acme(
                  color:  BlueColor.withOpacity(0.6), fontSize: 15
              ),
              suffixIcon: const Icon(
                Icons.search_rounded,
                color: YellowColor, size: 25,
              ),
            ),
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //       top: 40, right: 20, bottom: 20),
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     decoration: const BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: WhiteColor,
          //         boxShadow: [
          //           BoxShadow(
          //             color: BlueColor,
          //             offset: Offset(0, 1),
          //             blurRadius: 3.0,
          //             spreadRadius: 1.0,
          //           ),
          //         ]
          //     ), //icon inside button,
          //     child: IconButton(
          //       icon: const Icon(
          //         Icons.messenger, color: YellowColor, size: 20,),
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (context) =>HomeScreen(
          //
          //           )),
          //         );
          //       },
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //       top: 40, left: 5, right: 15, bottom: 20),
          //   child: Container(
          //     width: 40,
          //     height: 40,
          //     decoration: const BoxDecoration(
          //         shape: BoxShape.circle,
          //         color: WhiteColor,
          //         boxShadow: [
          //           BoxShadow(
          //             color: BlueColor,
          //             offset: Offset(0, 1),
          //             blurRadius: 3.0,
          //             spreadRadius: 1.0,
          //           ),
          //         ]
          //     ), //icon inside button,
          //     child: IconButton(
          //       icon: const Icon(
          //         Icons.notifications_rounded, color: YellowColor, size: 25,),
          //       onPressed: () {
          //                 Navigator.of(context).push(
          //                 MaterialPageRoute(builder: (context) => NotificationList()));
          //       },
          //     ),
          //   ),
          // ),
        ],

      ),
      body: Column(
        children: [
          const SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: TabBar(
                    unselectedLabelColor: BlueColor,
                    labelColor: YellowColor,
                    indicatorColor: YellowColor,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.label,
                    controller: tabController,
                    isScrollable: true,
                    tabs: [
                      Text("Hotels",maxLines: 1, style: GoogleFonts.acme(
                        fontSize: 12,

                        ),),
                      Text("Restaurants & Cafes", style: GoogleFonts.acme(
                        textStyle: const TextStyle(fontSize: 11,
                        ),),),
                      Text("Resorts & Villages", style: GoogleFonts.acme(
                        textStyle: const TextStyle(fontSize: 11,
                        ),),),
                      Text("Tourism Companies", style: GoogleFonts.acme(
                        textStyle: const TextStyle(fontSize: 11,
                        ),),),
                      Text("Transport Companies", style: GoogleFonts.acme(
                        textStyle: const TextStyle(fontSize: 11,
                        ),),),
                      Text(" Cinemas", style: GoogleFonts.acme(
                        textStyle: const TextStyle(fontSize: 12,
                        ),),),
                      Text(" Bazaars", style: GoogleFonts.acme(
                        textStyle: const TextStyle(fontSize: 12,
                        ),),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10, bottom: 10),
                  child: NewOffersHotels(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10, bottom: 10),
                  child: NewOffersRestaurants_Cafes(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10, bottom: 10),
                  child: NewOffersResorts_Villages(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10, bottom: 10),
                  child: NewOffersTourismCompany(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10, bottom: 10),
                  child: NewOffersTransportCompany(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10, bottom: 10),
                  child: NewOffersCinemas(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 10, right: 10, bottom: 10),
                  child: NewOffersBazaars(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



