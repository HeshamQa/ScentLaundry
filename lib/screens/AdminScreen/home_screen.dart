import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/screens/AdminScreen/orders_screen.dart';
import 'package:scentlaundry/screens/AdminScreen/sub_count.dart';
import 'package:scentlaundry/screens/AdminScreen/sub_screen.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';

import '../../utils/Static/consvalue.dart';
import '../../utils/Static/sharedpref.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: getProportionateScreenHeight(810),
        width: getProportionateScreenWidth(375),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ElevatedButton(onPressed: (){Get.to(const OrdersScreen());}, child: const Text("Orders")),
            ElevatedButton(onPressed: (){Get.to(const SubAdminScreen());}, child: const Text("Subscriptions")),
            ElevatedButton(onPressed: (){Get.to(const SubCount());}, child: const Text("Subscription Count")),
            ElevatedButton(onPressed: (){
              General.remove(ConsValues.id);
              General.remove(ConsValues.NAME);
              General.remove(ConsValues.PHONE);
              General.remove(ConsValues.USER_TYPE);
              ConsValues.isLoggedIn=false;
              Get.offAllNamed(Approute.Login);}, child: const Text("LOGOUT")),
        ],),
      ),
    );
  }
}
