import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';

import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';
import '../../../../utils/Widget/Custom_Container.dart';

class BottomBill extends StatelessWidget {
  const BottomBill({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(225),
      child: CustomContainer(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Service Price",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),),
                  Text("8.50 JOD",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),)
                ],
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Price",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),),
                  Text("3.00 JOD",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),)
                ],
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Price",style: TextStyle(fontSize: 22), ),
                  Text("11.50 JOD",style: TextStyle(fontSize: 22),)
                ],
              ),
              CustomButton(press: (){Get.offAllNamed(Approute.OrderStatusScreen);}, title: "Place Order")
            ],
          ),
        ),
      ),
    );
  }
}
