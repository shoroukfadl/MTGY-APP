import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/services/network/bloc_observer.dart';
import 'package:mtgy_app/services/network/chache_helper.dart';
import 'package:mtgy_app/services/network/dio/dio_helper.dart';
import 'package:mtgy_app/view/weclome/welcome.dart';
import '../../../services/widgets/constant.dart';
import 'controller/SP_cubit/cubit.dart';
import 'controller/client_home_cubit/cubit.dart';
import 'controller/search_cubit/cubit.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
 Bloc.observer = MyBlocObserver();
 await DioHelper.init();
  await CacheHelper.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //bool client = CacheHelper.getData(key: "client")!;
 // print("$client");
   Widget? widget;
   token =  await CacheHelper.getData(key: 'token')  ;
   print("token from main :$token");

  // if(client )
  //   {
  //     if(token.isNotEmpty )
  //       {
  //         widget = MainHome();
  //       }
  //     else
  //       {
  //         widget = ClientSignIn();
  //       }
  //   }
  // else{
  //   widget = Client();
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // SystemChrome.setEnabledSystemUIMode(
  // SystemUiMode.manual, overlays: SystemUiOverlay.values);
  int index = 0;

  //Widget widget;
  //MyApp({required this.widget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
      BlocProvider(create: (_)=>UHomeCubit()..getClientProfile()..GetHotelData()..GetCinemaData()
        ..GetNaturalData()..
        GetTransportationCompanyData()..GetTourismCompanyData()..
        GetResortAndVillageData()..GetBazaarData()..GetRestaurantAndCafeData()..GetAgrData()..UGetCart(),
      ),
       BlocProvider(create: (_)=>SPHomeCubit()..getSPProfile()..getSPOffers()..SPGetreview()),
       BlocProvider(create: (_)=>USearchCubit()),
     ],
      child: MaterialApp(
        home: Welcome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


