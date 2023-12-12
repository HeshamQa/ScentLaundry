import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(75)),
        child: CustomContainer(
            child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Image.asset('assets/images/orderstatus.png'),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Status : ',
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Accepted',
                  style: TextStyle(fontSize: 28, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20),
                  horizontal: getProportionateScreenWidth(25)),
              child: CustomButton(press: (){Get.offAllNamed(Approute.HomeScreen);}, title: "Back To Home"),
            ),
          ],
        )),
      ),
    );
  }
}
