import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';

import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Widget/Custom_Button.dart';
import '../../../utils/Widget/Custom_Container.dart';
import 'CurrentLoc.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(300),
      child: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchBar(),
                SizedBox(height: getProportionateScreenHeight(10)),
                const CurrentLoc(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(press: (){
                        Get.toNamed(Approute.pickuptime);
                  }, title: "Next"),
                ),
              ],
            ),
          )),
    );
  }
}
