import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import 'components/TimesSlot.dart';
import 'components/datetime.dart';

class pickuptime extends StatefulWidget {
  const pickuptime({super.key});

  @override
  State<pickuptime> createState() => _pickuptimeState();
}

class _pickuptimeState extends State<pickuptime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.primaryColor,
      appBar: AppBar(
        title: Text("Choose a pickup time"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Choose receipt Day",style: TextStyle(fontSize: 30)),
                SizedBox(height: getProportionateScreenHeight(20),),
                datetime(),
                Text("Choose receipt Time",style: TextStyle(fontSize: 30)),
                Timespicker(),
                SizedBox(height: getProportionateScreenHeight(15),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40.0) , vertical: getProportionateScreenHeight(20)),
                  child: CustomButton(press: () {
                     Get.toNamed(Approute.pickuptime2);
                  }, title: "Next"),
                )
              ],
            )),
      ),
    );
  }
}
