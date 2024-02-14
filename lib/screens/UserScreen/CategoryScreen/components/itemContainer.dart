import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';

class ItemContainer extends StatelessWidget {
  final Widget child;

  const ItemContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(85),
      width: getProportionateScreenWidth(375),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.black38, blurRadius: 7)
          ]),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(15)),
      child: child,
    );
  }
}
