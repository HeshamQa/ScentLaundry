import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/Static/Size_Config.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              iconSize: 30,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
          SizedBox(
              width: getProportionateScreenWidth(285),
              child: const Text("Place Order",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
