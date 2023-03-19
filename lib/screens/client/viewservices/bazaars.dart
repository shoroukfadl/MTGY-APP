
import 'package:flutter/material.dart';
import 'package:mtgy_app/models/utils/user_preferences.dart';
import 'package:mtgy_app/screens/client/viewservices/service_provider_account.dart';
import '../../../shared/widgets/constants.dart';


class Bazaars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return defultoffers(ontap1: (){

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
      );
    },
        name: 'Queen',

        rate: "3.5",
    ontap2: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
    );
    },
    image: user.imagePath);


  }
}
