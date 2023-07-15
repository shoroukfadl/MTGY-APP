
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/controller/SP_cubit/states.dart';
import '../../../../../controller/SP_cubit/cubit.dart';
import '../../../../../model/sp_get_offers/gett_offers.dart';
import '../../../../../services/widgets/constant.dart';
import '../../../../services/widgets/profile.dart';
import '../offers/all_offfers.dart';
import '../reviews/myreviews.dart';


class ServiceProviderHome extends StatefulWidget {
  const ServiceProviderHome({Key? key}) : super(key: key);

  @override
  State<ServiceProviderHome> createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome> with TickerProviderStateMixin {
  int index =0;
  late TabController tabController;
  bool isbottomsheet =false;
  IconData fabicon = Icons.edit_note;
  var scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> SPHomeCubit()..getSPOffers(),
      child: BlocConsumer<SPHomeCubit,SPHomeStates>(
        builder: ( context, state) {
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
                                      imagePath: "assets/images/hotel.jpg",
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,top:3.0),
                                child: buildName(offer_list),
                              ),
                            ],
                          ),
                        ]
                    ),
                  )
              ),

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
                          child: SPReviews(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),


          );
        },
        listener: (BuildContext context, Object? state) {  },

      ),
    );
  }
  Widget buildName(List<OffersDataModel> list) => Text(
    "mtgy",
    style: GoogleFonts.acme(color: BlueColor,fontSize: 17),
  );
  // Widget buildAddress(List<OffersDataModel> list , int index) => Text(
  //   list[0].cat
  //   style: GoogleFonts.aBeeZee(color: YellowColor,fontSize: 17),
  // );
  // Widget buildemail(List<OffersDataModel> list , int index) => Text(
  //   serviceprovider.email,
  //   style: GoogleFonts.aBeeZee(color:WhiteColor),
  // );
  // Widget buildphone(List<OffersDataModel> list , int index) => Text(
  //   serviceprovider.phone,
  //   style: GoogleFonts.aBeeZee(color:WhiteColor),
  // );
}



