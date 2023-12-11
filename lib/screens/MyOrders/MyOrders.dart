import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import 'components/OrderContainer.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(80)),
        child: const CustomContainer(
            child: Orders()
        ),
      ),
    );
  }
}