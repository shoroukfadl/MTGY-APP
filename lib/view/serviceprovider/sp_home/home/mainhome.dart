import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/serviceprovider/sp_home/settings/settings.dart';

import '../../../../../controller/SP_cubit/cubit.dart';
import '../../../../../controller/SP_cubit/states.dart';
import '../../../../../services/widgets/constant.dart';
import '../sp_profile/serviceprovideraccount.dart';
import 'home.dart';



class ServiceProviderMainHome extends StatelessWidget {
   ServiceProviderMainHome({Key? key}) : super(key: key);

   List<IconData> iconList =[
     Icons.home,
     Icons.settings_suggest,
     Icons.person
   ];

  Widget build(BuildContext context) {
    return BlocConsumer<SPHomeCubit,SPHomeStates>(
      builder: (context,state){
        return  Scaffold(
            body: getSelectedWidget(index: SPHomeCubit.get(context).index),
            bottomNavigationBar:Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10),
              child: CustomNavigationBar(
                selectedColor: WhiteColor,
                unSelectedColor:  YellowColor,
                backgroundColor: BlueColor ,
                currentIndex:  SPHomeCubit.get(context).index,
                elevation: 0,
                iconSize: 30,
                opacity: .2,
                scaleCurve:Curves.bounceIn,
                bubbleCurve: Curves.bounceInOut,
                borderRadius:Radius.circular(20) ,
                onTap: (sindex){
                  SPHomeCubit.get(context).changScreenInMainHome(sindex);
                },
                items: [
                  CustomNavigationBarItem(
                      icon: Icon(Icons.home),
                      selectedIcon: Icon(Icons.home_outlined),
                      selectedTitle: Text('HOME',style: GoogleFonts.acme(
                          color: WhiteColor
                      )),
                      title: Text('HOME',style: GoogleFonts.acme(
                          color: YellowColor
                      ),
                      )

                  ),
                  CustomNavigationBarItem(
                      icon: Icon(Icons.settings_suggest),
                      selectedTitle: Text('SETTINGS',style: GoogleFonts.acme(
                          color: WhiteColor
                      )),
                      selectedIcon: Icon(Icons.settings_suggest_outlined),
                      title: Text('SETTINGS',style: GoogleFonts.acme(
                          color: YellowColor
                      ),
                      )
                  ),
                  CustomNavigationBarItem(
                      icon: Icon(Icons.person),
                      selectedTitle: Text('SETTINGS',style: GoogleFonts.acme(
                          color: WhiteColor
                      )),
                      selectedIcon: Icon(Icons.person_outline),
                      title: Text('PROFILE',style: GoogleFonts.acme(
                          color: YellowColor
                      ),
                      )
                  ),
                ],

              ),
            )

        );
      },
      listener: (context,state){},
    );
  }


  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const ServiceProviderHome();
        break;
      case 1:
        widget =  Settings();
        break;
      default:
        widget =  ServiceProviderAccount();
        break;
    }
    return widget;
  }
}
