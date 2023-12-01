
import 'package:flutter/material.dart';

import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Widget/Custom_Button.dart';
import '../../../utils/Widget/Custom_Container.dart';

class SubBody extends StatelessWidget {
  const SubBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),vertical: getProportionateScreenHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "100 Item - 75JOD",
              style: TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text(
              "The subscription containing 100 pieces"
                  " of (T-Shirt, Pants, Short, underwear,"
                  " Sucks, shoes) for only 75 JOD.",
              style: TextStyle(fontSize: 19, fontFamily: 'reg'),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text(
              "If you want to subscribe Press "
                  "the button below",
              style: TextStyle(fontSize: 20, fontFamily: 'inter'),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10.0)),
              child: CustomButton(press: () {}, title: "Subscribe"),
            ),
          ],
        ),
      ),
    );
  }
}