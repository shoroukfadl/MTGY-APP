

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtgy_app/view/client/home/settings/settings.dart';

import '../../../../controller/client_home_cubit/cubit.dart';
import '../../../../controller/client_home_cubit/states.dart';
import '../../../../services/widgets/constant.dart';
import '../client_profile/cleintprofile.dart';
import '../services/service.dart';

class MainHome extends StatelessWidget {
   MainHome({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    return BlocConsumer<UHomeCubit,UHomeStates>(
      builder: ( context, state) {
        return  Scaffold(
          body: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              child: getSelectedWidget(index: UHomeCubit.get(context).index)
          ),
            bottomNavigationBar:Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10),
              child: CustomNavigationBar(
                selectedColor: WhiteColor,
                unSelectedColor:  YellowColor,
                backgroundColor: BlueColor ,
                currentIndex: UHomeCubit.get(context).index,
                elevation: 0,
                iconSize: 30,
                opacity: .2,
                scaleCurve:Curves.bounceIn,
                bubbleCurve: Curves.bounceInOut,
                borderRadius:const Radius.circular(20) ,
                onTap: (Sindex){
                  UHomeCubit.get(context).changScreenInMainHome(Sindex);
                },
                items: [
                  CustomNavigationBarItem(
                      icon: const Icon(Icons.apps),
                      selectedIcon: const Icon(Icons.grid_on_outlined),
                      selectedTitle: Text('OFFERS',style: GoogleFonts.acme(
                          color: WhiteColor
                      )),
                      title: Text('OFFERS',style: GoogleFonts.acme(
                          color: YellowColor
                      ),
                      )

                  ),
                  CustomNavigationBarItem(
                      icon: const Icon(Icons.settings_suggest),
                      selectedIcon: const Icon(Icons.settings_suggest_outlined),
                      selectedTitle: Text('SETTINGS',style: GoogleFonts.acme(
                          color: WhiteColor
                      )),
                      title: Text('SETTINGS',style: GoogleFonts.acme(
                          color: YellowColor
                      ),
                      )

                  ),
                  CustomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      selectedTitle: Text('PROFILE',style: GoogleFonts.acme(
                          color: WhiteColor
                      )),
                      selectedIcon: const Icon(Icons.person_outline),
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
      listener: ( context, Object? state) {  },
    );
  }

  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      // case 0:
      //   widget = const Home();
      //   break;
      case 0:
        widget =  const Services();
        break;
      case 1:
        widget =  Settings();
        break;
      default:
        widget =   ClientProfile();
        break;
    }
    return widget;
  }
}
