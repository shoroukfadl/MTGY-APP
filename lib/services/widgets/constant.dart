import 'package:flutter/material.dart';

import '../../model/order_pay/get_cart.dart';
import '../../model/reviews/c_reviews.dart';
import '../../model/reviews/sp_reviews.dart';
import '../../model/services_models/ArchaeologicalSite/archaeologicalSite.dart';
import '../../model/services_models/Bazaar/bazaar.dart';
import '../../model/services_models/Natural/Natural.dart';
import '../../model/services_models/TourismCompany/TourismCompany.dart';
import '../../model/services_models/TransportationCompany/transportationCompany.dart';
import '../../model/services_models/cinema/cinema.dart';
import '../../model/services_models/hotels/hotels.dart';
import '../../model/services_models/resortAndVillage/resortAndVillage.dart';
import '../../model/services_models/restaurantAndCafe/restaurantAndCafe.dart';
import '../../model/sp_for_client/sp_for_client.dart';
import '../../model/sp_get_offers/gett_offers.dart';

String? token = '';
String? resetPasstoken = '';
String? SPDeleteEmail = '';
String? SPID = '';
List<DataModel> Natural_list =[];
List<AgrDataModel> agr_list =[];
List<SPGetReviewsDataModel> SP_reviews =[];
List<CGetReviewsDataModel> C_reviews =[];
List<OffersDataModel> offer_list =[];
List<HotelDataModel> hotel_list =[];
List<CinemaDataModel> cinama_list =[];
List<restDataModel> cafe_list =[];
List<tourismDataModel> tourismcomp_list =[];
List<transportDataModel> Transportation_list =[];
List<BazaarDataModel> Bazaar_list =[];
List<resortDataModel> resort_list =[];

List<getcartDataModel> getcart_list =[];
GetSPproForCModel? spprofilemodel2;
int numofclients = 0;
double totalcost = 0;
const WhiteColor = Color(0xFFFFFFFF);
const BlueColor = Color(0xff023859);
const YellowColor = Color(0xffdaa520);
const Transparent = Colors.transparent;

const kDefaultPadding = 24.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;
const kLess = 4.0;
const kShape = 30.0;
const kRadius = 0.0;
const kAppBarHeight = 56.0;

