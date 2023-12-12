import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import 'components/TimesSlot2.dart';
import 'components/datetime2.dart';

class pickuptime2 extends StatefulWidget {
  const pickuptime2({super.key});

  @override
  State<pickuptime2> createState() => _pickuptimeState();
}

class _pickuptimeState extends State<pickuptime2> {
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
                Text("Choose Pickup Day",style: TextStyle(fontSize: 30)),
                SizedBox(height: getProportionateScreenHeight(20),),
                datetime2(),
                Text("Choose Pickup Time",style: TextStyle(fontSize: 30)),
                Timespicker2(),
                SizedBox(height: getProportionateScreenHeight(15),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40.0) , vertical: getProportionateScreenHeight(20)),
                  child: CustomButton(press: () {
                    Get.toNamed(Approute.PaymentScreen);
                  }, title: "Next"),
                )
              ],
            )),
      ),
    );
  }
}
