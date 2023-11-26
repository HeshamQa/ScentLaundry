import 'package:flutter/material.dart';
import 'package:scentlaundry/Size_Config.dart';

import 'Components/MyCustomClipper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              width: getProportionateScreenWidth(375),
              height: getProportionateScreenHeight(406),
              color: const Color(0xffBFDBFE),
            ),

          )

        ],
      ),
    );
  }
}
