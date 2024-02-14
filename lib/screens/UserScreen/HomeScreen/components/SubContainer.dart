import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';

class SubContainer extends StatelessWidget {
  final Widget child;

  const SubContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(320),
      height: getProportionateScreenHeight(160),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.black38, blurRadius: 7, offset: Offset(1, 1))
          ]),
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          right: getProportionateScreenWidth(20),
          bottom: getProportionateScreenHeight(10)),
      child: child,
    );
  }
}
