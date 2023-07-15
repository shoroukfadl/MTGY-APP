import 'dart:io';

import 'package:flutter/material.dart';
import 'constant.dart';

class ClientProfileWidget extends StatelessWidget {
  final String imagePath;

  const ClientProfileWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =YellowColor;

    return Stack(
      children: [
        buildImage(),
      ],
    );
  }

  Widget buildImage() {

    return ClipOval(
      child: Material(
        color: Transparent,
        child: Ink.image(
          image:  AssetImage(imagePath),
          fit: BoxFit.cover,
          width: 170,
          height: 170,
        ),
      ),
    );
  }


  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
