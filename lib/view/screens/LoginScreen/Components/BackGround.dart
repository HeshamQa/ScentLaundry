
import 'package:flutter/material.dart';

import '../../../../Size_Config.dart';
import 'MyCustomClipper.dart';

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
