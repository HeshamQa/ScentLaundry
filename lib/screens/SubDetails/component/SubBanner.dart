
import 'package:flutter/material.dart';

import '../../../utils/Static/Size_Config.dart';

class SubBanner extends StatelessWidget {
  const SubBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(375),
      height: getProportionateScreenHeight(150),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(25)),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black54,blurRadius: 10,spreadRadius: 2,offset: Offset(2, 4))
          ]
      ),
      child: Hero(
        tag: '1',
        child: Image.asset(
          "assets/images/banner.jpg",
          fit: BoxFit.fill,
          // width: getProportionateScreenWidth(375),
          // height: getProportionateScreenHeight(200),
        ),
      ),
    );
  }
}
