import 'package:flutter/material.dart';

import '../Static/Size_Config.dart';

class BackGround extends StatelessWidget {
  final double height;
  final String title;
  final double h;
  const BackGround({
    super.key, required this.height, required this.title, required this.h,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            width: getProportionateScreenWidth(375),
            height: height,
            color: const Color(0xffBFDBFE),
          ),
        ),
         SizedBox(
          width: getProportionateScreenWidth(375),
          height: height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    width: getProportionateScreenWidth(200),
                    height: getProportionateScreenHeight(100),
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/images/logo.png",),),
              ),
              SizedBox(height: getProportionateScreenHeight(h)),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    double triangleWidth = getProportionateScreenWidth(360);
    double triangleHeight = getProportionateScreenHeight(125);
    double trianglePosition = (size.width - triangleWidth) / 2;
    double curveHeight = getProportionateScreenHeight(20);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Add a curve to the top middle
    path.moveTo(trianglePosition, size.height);
    path.lineTo(trianglePosition + triangleWidth / 2 - curveHeight, size.height - triangleHeight);
    path.quadraticBezierTo(
        trianglePosition + triangleWidth / 2, size.height - triangleHeight - curveHeight,
        trianglePosition + triangleWidth / 2 + curveHeight, size.height - triangleHeight);
    path.lineTo(trianglePosition + triangleWidth, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
