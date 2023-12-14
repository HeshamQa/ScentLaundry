import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import 'components/TimesSlot.dart';
import 'components/datetime.dart';

class PickupDayScreen extends StatefulWidget {
  const PickupDayScreen({super.key});

  @override
  State<PickupDayScreen> createState() => _PickupDayScreenState();
}

class _PickupDayScreenState extends State<PickupDayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.primaryColor,
      appBar: AppBar(
        title: const Text("Choose a Pick Up time"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Choose Pick Up Day",style: TextStyle(fontSize: 30)),
                SizedBox(height: getProportionateScreenHeight(20),),
                const DatesTime(),
                const Text("Choose Pick Up Time",style: TextStyle(fontSize: 30)),
                const TimesPicker(),
                SizedBox(height: getProportionateScreenHeight(15),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40.0) , vertical: getProportionateScreenHeight(20)),
                  child: CustomButton(press: () {
                     Get.toNamed(Approute.ReceiptTime);
                  }, title: "Next"),
                )
              ],
            )),
      ),
    );
  }
}
