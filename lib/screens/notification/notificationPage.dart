
import 'package:flutter/material.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

import '../../shared/widgets/constants.dart';
import 'components/defaultAppBar.dart';

class NotificationPage extends StatefulWidget {


  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: DefaultAppBar(
        title: 'Notification',
        child: defultbackbutton(context),
      ),
      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color(0xffffffff),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [BoxShadow(color: BlueColor, blurRadius: 2.0)]),
          child: Column(
            children: const [
              Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                style: TextStyle(color: YellowColor,fontSize: 17),),
              SizedBox(height: 16.0),
              Image(image: AssetImage("assets/images/graph.png")),
              SizedBox(height: 16.0),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  style: TextStyle(color: BlueColor,fontSize: 17)),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text('11/Feb/2021 04:42 PM',
                    style: TextStyle(color: BlueColor,fontSize: 17)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
