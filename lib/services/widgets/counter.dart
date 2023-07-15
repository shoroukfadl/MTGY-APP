import 'package:flutter/material.dart';

import 'constant.dart';


class ListTileItem extends StatefulWidget {
  const ListTileItem({super.key});

  @override
  _ListTileItemState createState() => new _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  @override
  int currentCount=0;
  void Decrement() {
    setState(() {
      if (currentCount > 1) {
        currentCount--;
      }
      else
        currentCount = 0;
    });
  }
  void Increment(){
    setState(() {
        currentCount++;
    });
  }
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () =>Decrement(),
            icon: const Icon(
              Icons.remove_circle,
              color: YellowColor,
              size: 40,
            )),
        SizedBox(width: 10,),
        Container(
          width: 50,height: 50,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: WhiteColor,
              boxShadow:  [
              BoxShadow(
              color:  BlueColor,
          offset: Offset(0,3),
          blurRadius: 4.0,
          spreadRadius: 2.0,
        ),
      ],
          ),
          child:  Center(
            child: Text(currentCount.toString(),
              style: TextStyle(color: YellowColor, fontSize: 20),
            ),
          ),
        ),
        SizedBox(width: 10,),
        IconButton(
            onPressed: () =>Increment(),
            icon: const Icon(
              Icons.add_circle,
              color: YellowColor,
              size: 40,
            ))
        ,SizedBox(width: 10,),
      ],
    );
  }
}