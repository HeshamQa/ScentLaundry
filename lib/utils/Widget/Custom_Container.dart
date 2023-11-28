import 'package:flutter/material.dart';

import '../Static/Size_Config.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
            // left: getProportionateScreenWidth(30),
            top: getProportionateScreenHeight(25),
            // bottom: getProportionateScreenHeight(5)
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22))),
        child:child,
    );
  }
}
