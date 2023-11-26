
import 'package:flutter/material.dart';

import '../../../../Size_Config.dart';
import 'MyCustomClipper.dart';

class BackGround extends StatelessWidget {
  final double height;
  final String title;
  const BackGround({
    super.key, required this.height, required this.title,
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
          height: getProportionateScreenHeight(400),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: getProportionateScreenHeight(70)),
              Image.asset("assets/images/logo.png",
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenHeight(100)),
              SizedBox(height: getProportionateScreenHeight(170)),
              Text(title,
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
