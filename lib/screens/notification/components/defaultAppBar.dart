import 'package:flutter/material.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';



class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Widget child;
  final action;
  const DefaultAppBar({required this.title,required this.child, this.action,}) ;

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color:BlueColor)),
      centerTitle: true,
      backgroundColor: WhiteColor,
      elevation: 0,
      toolbarHeight: 120,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: BlueColor),
      leading: child,
      actions: action,
    );
  }
}