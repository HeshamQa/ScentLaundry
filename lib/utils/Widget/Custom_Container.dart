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
            top: getProportionateScreenHeight(25),
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30))),
        child:child,
    );
  }
}
