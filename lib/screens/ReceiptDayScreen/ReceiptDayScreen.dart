import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import 'components/TimesSlot2.dart';
import 'components/datetime2.dart';

class ReceiptTime extends StatefulWidget {
  const ReceiptTime({super.key});

  @override
  State<ReceiptTime> createState() => _ReceiptTimeState();
}

class _ReceiptTimeState extends State<ReceiptTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.primaryColor,
      appBar: AppBar(
        title: const Text("Choose a Receipt time"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Choose Receipt Day",style: TextStyle(fontSize: 30)),
                SizedBox(height: getProportionateScreenHeight(20),),
                const DatesTime(),
                const Text("Choose Receipt Time",style: TextStyle(fontSize: 30)),
                const Timespicker2(),
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
