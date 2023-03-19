
import 'package:flutter/material.dart';
import 'package:mtgy_app/models/utils/user_preferences.dart';
import 'package:mtgy_app/screens/client/viewservices/service_provider_account.dart';

import '../../../shared/widgets/constants.dart';



class Hotels extends StatefulWidget {
  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Column(
      children:
      [
        Row(
          children: [
            Expanded(
              child: defultoffers(
                ontap1: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
                );
              },
                ontap2: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),);
                }, image:
                 user.imagePath, name: "Hotel1",
                rate: "4.2",
              ),
            ),
            Expanded(
              child: defultoffers(ontap1: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
                );
              },
                ontap2: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),);
                }, image:
                user.imagePath, name: "Hotel2",
                rate: "3.8",
              ),
            ),
          ],
        ),

        Row(
          children: [
            Expanded(
              child: defultoffers(
                ontap1: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
                  );
                },
                ontap2: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),);
                }, image:
              user.imagePath, name: "Hotel3",
                rate: "3.5",
              ),
            ),
            Expanded(
              child: defultoffers(ontap1: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
                );
              },
                ontap2: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),);
                }, image:
                user.imagePath, name: "Hotel4",
                rate: "3.2",
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: defultoffers(
                ontap1: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
                  );
                },
                ontap2: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),);
                }, image:
              user.imagePath, name: "Hotel3",
                rate: "3.5",
              ),
            ),
            Expanded(
              child: defultoffers(ontap1: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),
                );
              },
                ontap2: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ServicesProviderAccount()),);
                }, image:
                user.imagePath, name: "Hotel4",
                rate: "3.2",
              ),
            ),
          ],
        ),

      ]
    );
  }
}
