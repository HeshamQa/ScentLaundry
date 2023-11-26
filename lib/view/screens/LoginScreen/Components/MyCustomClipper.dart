import 'package:flutter/material.dart';
import 'package:scentlaundry/Size_Config.dart';

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double triangleWidth = getProportionateScreenWidth(375);
    double triangleHeight = getProportionateScreenHeight(150);
    double trianglePosition = (size.width - triangleWidth) / 2;

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.moveTo(trianglePosition, size.height);
    path.lineTo(trianglePosition + triangleWidth / 2, size.height - triangleHeight);
    path.lineTo(trianglePosition + triangleWidth, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
