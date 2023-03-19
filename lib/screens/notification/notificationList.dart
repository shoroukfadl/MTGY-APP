
import 'package:mtgy_app/shared/widgets/constant.dart';

import 'package:flutter/material.dart';
import '../../shared/widgets/constants.dart';
import 'components/defaultAppBar.dart';
import 'notificationPage.dart';

class NotificationList extends StatefulWidget {


  @override
  _NotificationListState createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WhiteColor,
      appBar: DefaultAppBar(
        title: 'Notifications',
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: defultbackbutton(context),
        ),
      ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/Logo_final.png"), fit: BoxFit.cover))),
              title: Text( 'Serviceprovider name', style: TextStyle(color:YellowColor)),
              subtitle: Text('new offer from service provider ',
                  style: TextStyle(color:BlueColor)),
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => NotificationPage()));
                });
              },
              enabled: true,
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
