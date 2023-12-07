
import 'package:flutter/material.dart';

import '../../../data/models/SubscribeModel.dart';
import '../../../utils/Static/Size_Config.dart';

class SubBanner extends StatelessWidget {
  final SubscribeModel subscribeModel;
  const SubBanner({
    super.key, required this.subscribeModel,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: subscribeModel.name,
      child: Container(
        width: getProportionateScreenWidth(375),
        height: getProportionateScreenHeight(150),
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(15),
            vertical: getProportionateScreenHeight(25)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(color: Colors.black54,blurRadius: 10,offset: Offset(2, 4))
            ]
        ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              subscribeModel.image,
              fit: BoxFit.fill,
            ),
          ),
      ),
    );
  }
}
