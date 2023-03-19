import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtgy_app/screens/client/googlemaps/Pages/map/map_page.dart';
import 'package:mtgy_app/screens/client/home/cubit/cubit.dart';
import 'package:mtgy_app/screens/client/home/cubit/states.dart';
import 'package:mtgy_app/screens/client/home/screen/client_profile/cleintprofile.dart';
import 'package:mtgy_app/screens/client/home/screen/main_home/client_main_home.dart';
import 'package:mtgy_app/screens/client/home/screen/services/natural_preserves.dart';
import 'package:mtgy_app/screens/client/home/screen/services/service.dart';
import 'package:mtgy_app/screens/client/home/screen/settings/chagepassword.dart';
import 'package:mtgy_app/screens/client/home/screen/settings/edit_profile_client.dart';
import 'package:mtgy_app/screens/client/home/screen/settings/settings.dart';
import 'package:mtgy_app/screens/client/pay&order/pay.dart';
import 'package:mtgy_app/screens/client/viewservices/viewservices.dart';
import 'package:mtgy_app/screens/serviceprovider/home/cubit/cubit.dart';
import 'package:mtgy_app/screens/signin/cubit/cubit.dart';
import 'package:mtgy_app/screens/signin/cubit/states.dart';
import 'package:mtgy_app/screens/signin/screens/client/cilent_signin.dart';
import 'package:mtgy_app/screens/signin/screens/client/creset_password.dart';
import 'package:mtgy_app/screens/signin/screens/client/email_reset_pass.dart';
import 'package:mtgy_app/screens/signin/screens/client/verfiy_email.dart';
import 'package:mtgy_app/screens/signin/screens/serviceprovider/serviceprovider_signin.dart';
import 'package:mtgy_app/screens/signup/client_1.dart';
import 'package:mtgy_app/screens/signup/serviceprovider_1.dart';
import 'package:mtgy_app/screens/weclome/client.dart';
import 'package:mtgy_app/screens/weclome/welcome.dart';
import 'package:mtgy_app/shared/network/bloc_observer.dart';
import 'package:mtgy_app/shared/network/chache_helper.dart';
import 'package:mtgy_app/shared/network/dio/dio_helper.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

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
      BlocProvider(create: (_)=>UHomeCubit()..getClientProfile()..GetNaturalData()),
       BlocProvider(create: (_)=>SPHomeCubit()..getSPProfile())
     ],
      child: MaterialApp(
        home: ServiceProviderSignUp(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}


