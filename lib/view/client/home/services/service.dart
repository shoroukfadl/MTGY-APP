import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/bazaars.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/cinemas.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/hotels.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/resorts&villages.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/restaurants.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/tourism_company.dart';
import 'package:mtgy_app/view/client/home/services/viewservices/offers/transport_company.dart';
import '../../../../services/widgets/constant.dart';
import '../../google_MTGY/current_location_screen.dart';
import '../../search/search.dart';
import 'Historcal/archaeological_sites.dart';

import 'Historcal/natural_preserves.dart';




class Services extends StatefulWidget {
  const Services({Key? key}) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services>  with TickerProviderStateMixin{
  late TabController tabController;

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
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(
              top: 30, left: 10, right: 10,bottom: 20),
          child: TextField(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Search()),
              );
            },
            cursorColor:  BlueColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2, color: BlueColor,),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2, color: BlueColor,),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "search For Services ",
              hintStyle: GoogleFonts.acme(
                  color:  BlueColor.withOpacity(0.6), fontSize: 15
              ),
              suffixIcon: const Icon(
                Icons.search_rounded,
                color: YellowColor, size: 20,
              ),
            ),
          ),
        ),
        actions: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //       right: 10, top: 30, bottom: 20),
          //   child: Container(
          //     width: 35,
          //     height: 45,
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
          //     child: buildAccountOptionRow(context,' Try these archaeological sites With VR'),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
                top: 30, left: 10,right: 20, bottom: 20),
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
                  Icons.location_searching_rounded, color: YellowColor, size: 20,),
                onPressed: () {
                 try{
                   Navigator.of(context).push(
                       MaterialPageRoute(builder: (context) =>CurrentLocationScreen()
                       ));
                 }catch(error){
                   print("error is :$error");
                  };
                }
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 230,
                        child: Card(
                          color:  BlueColor,
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ArchaeologicalSites()
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Archaeological sites".toUpperCase(),
                                  style: GoogleFonts.acme(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: WhiteColor
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        width: 230,
                        child: Card(
                          color:   YellowColor,
                          elevation: 0.4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NaturalPreserves()
                                  ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "Natural Preserves".toUpperCase(),
                                  style:  GoogleFonts.acme(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color:  WhiteColor
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.height,
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
                                Text("Hotels", maxLines:1,style: GoogleFonts.acme(
                                 fontSize: 12,
                                  ),),
                                Text("Restaurants & Cafes", style: GoogleFonts.acme(
                                  fontSize: 11,
                                  ),),
                                Text("Resorts & Villages",  style: GoogleFonts.acme(
                                  fontSize: 11,
                                  ),),
                                Text("Tourism Companies",  style: GoogleFonts.acme(
                                  textStyle: const TextStyle(fontSize: 11,
                                  ),),),
                                Text("Transport Companies", style: GoogleFonts.acme(
                                  textStyle: const TextStyle(fontSize: 11,
                                  ),),),
                                Text(" Cinemas", maxLines:1, style: GoogleFonts.acme(
                                  textStyle: const TextStyle(fontSize: 12,
                                  ),),),
                                Text(" Bazaars",maxLines:1, style: GoogleFonts.acme(
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
                            child: Hotels(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10, bottom: 10),
                            child: Restaurants_Cafes(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10, bottom: 10),
                            child: Resorts_Villages(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10, bottom: 10),
                            child: TourismCompany(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10, bottom: 10),
                            child:TransportCompany(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10, bottom: 10),
                            child: Cinemas(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 10, right: 10, bottom: 10),
                            child: Bazaars(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                title: Text(
                  title,
                  style: GoogleFonts.acme(fontSize: 18,
                      color: BlueColor.withOpacity(
                          0.7)),
                ),
                children: <Widget>[
                  SimpleDialogOption(
                      onPressed: () { },
                      child: Text('archaeological sites 1',style: GoogleFonts.acme(fontSize: 18,
                          color: BlueColor),
                      )),
                  SimpleDialogOption(
                      onPressed: () { },
                      child:  Text('archaeological sites 2',style: GoogleFonts.acme(fontSize: 18,
                          color: BlueColor),
                      )),
                ],

              );
            });
      },
      child: const Padding(
        padding:  EdgeInsets.all( 8.0),
        child:  ImageIcon(
          AssetImage("assets/icons/vr.png"),
          color: YellowColor, size: 20,
        ),
      ),
    );
  }


}
