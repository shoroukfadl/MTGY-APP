import 'package:flutter/material.dart';
import 'package:mtgy_app/shared/widgets/constant.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = YellowColor;

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
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          width: 130,
          height: 130,
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
