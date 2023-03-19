import 'package:button_navigation_bar/button_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/screens/serviceprovider/models/profile.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';
import 'package:mtgy_app/models/service_type_model.dart';
import 'package:mtgy_app/models/serviceprovider.dart';
import 'package:mtgy_app/models/utils/serviceprovider_preferences.dart';

import '../../../../notification/notificationList.dart';
import '../../../chats/screens/home_screen.dart';
import '../../../offers/all_offfers.dart';
import '../../../reviews/myreviews.dart';


class ServiceProviderHome extends StatefulWidget {
  const ServiceProviderHome({Key? key}) : super(key: key);

  @override
  State<ServiceProviderHome> createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> with TickerProviderStateMixin {

  late TabController tabController;
  int index =0;
  final serviceprovider = ServiceProviderPreferences.serviceprovider;
  int currentindex=0;
  bool isbottomsheet =false;
  IconData fabicon = Icons.edit_note;
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
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
      key: scaffoldkey,
      backgroundColor: WhiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Transparent,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            color: WhiteColor,
            height: 60,
            child: Row(
                children: [
            Row(
            children: [
            Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                      color:YellowColor,
                      shape: BoxShape.circle

                  ),
                ),
                ServicrProfileWidget(
                  imagePath: serviceprovider.imagePath,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,top:3.0),
            child: buildName(serviceprovider),
          ),
          ],
        ),
        ]
      ),
    )
    ),
        actions: [
          const SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
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
              child: IconButton(onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NotificationList()));
              },
                  icon: const Icon(
                Icons.notifications_rounded,
                color:YellowColor,
                size: 20,
              ),
            ),
        ),
          ),
          const SizedBox(width: 30,),
        ]
      ),
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10),
        child: Column(
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
                        Text("MY OFFERS",maxLines: 1, style: GoogleFonts.acme(
                          fontSize: 15,
                        ),),
                        Text("MY REVIEWS", style: GoogleFonts.acme(
                          textStyle: const TextStyle(fontSize: 15,
                          ),),),
                        // Text("MY PAYMENTS", style: GoogleFonts.acme(
                        //   textStyle: const TextStyle(fontSize: 15,
                        //   ),),),
                        Text("MY CHATS", style: GoogleFonts.acme(
                          textStyle: const TextStyle(fontSize: 15,
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
                children:  [
                   Padding(
                    padding:  const EdgeInsets.only(
                        top: 20.0, bottom: 10),
                    child: Offers(),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(
                        top:10, bottom: 10),
                    child: MyReviews(),
                  ),
                  // const Padding(
                  //   padding:  EdgeInsets.only(
                  //       top: 20.0, left: 10, right: 10, bottom: 10),
                  //   child: MyPayments(),
                  // ),
                   Padding(
                    padding:  EdgeInsets.only(
                        top: 20.0, left: 10, right: 10, bottom: 10),
                    child: MyChat(),
                  ),


                ],
              ),
            )
          ],
        ),
      ),


    );
  }
  Widget buildName(ServiceProvider serviceprovider) => Text(
    serviceprovider.name,
    style: GoogleFonts.acme(color: BlueColor,fontSize: 17),
  );
  Widget buildAddress(ServiceProvider serviceprovider) => Text(
    serviceprovider.address,
    style: GoogleFonts.aBeeZee(color: YellowColor,fontSize: 17),
  );
  Widget buildemail(ServiceProvider serviceprovider) => Text(
    serviceprovider.email,
    style: GoogleFonts.aBeeZee(color:WhiteColor),
  );
  Widget buildphone(ServiceProvider serviceprovider) => Text(
    serviceprovider.phone,
    style: GoogleFonts.aBeeZee(color:WhiteColor),
  );
}



