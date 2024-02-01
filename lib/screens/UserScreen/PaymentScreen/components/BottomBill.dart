// ignore_for_file: use_build_context_synchronously

import'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/order_provider.dart';
import 'package:scentlaundry/screens/UserScreen/PlaceOrder/PlaceOrder.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import '../../../../controller/providers/cartprovider.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';
import '../../../../utils/Widget/Custom_Container.dart';

class BottomBill extends StatelessWidget {
  final DateTime pDate;
  final DateTime rDate;
  final String ptime;
  final String rtime;
  const BottomBill({
    super.key,
    required this.pDate,
    required this.rDate, required this.ptime, required this.rtime,
  });

  @override
  Widget build(BuildContext context) {
    var totalPrice = 0.0;
    return SizedBox(
      height: getProportionateScreenHeight(225),
      child: CustomContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).ServicePrice,
                    style: const TextStyle(fontSize: 18, fontFamily: 'Inter'),
                  ),
                  Consumer<CartProvider>(
                    builder: (BuildContext context, CartProvider value,
                            Widget? child) =>
                        Text(
                      "${value.totalPrice}${S.of(context).JOD}",
                      style: const TextStyle(fontSize: 18, fontFamily: 'Inter'),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).DeliveryPrice,
                    style: const TextStyle(fontSize: 18, fontFamily: 'Inter'),
                  ),
                  Text(
                    "3.00${S.of(context).JOD}",
                    style: const TextStyle(fontSize: 18, fontFamily: 'Inter'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    S.of(context).TotalPrice,
                    style: const TextStyle(fontSize: 22),
                  ),
                  Consumer<CartProvider>(builder: (context, value, child) {
                    totalPrice = value.totalPrice + 3.00;
                    return Text(
                      "${value.totalPrice + 3.00}${S.of(context).JOD}",
                      style: const TextStyle(fontSize: 22),
                    );
                  })
                ],
              ),
              CustomButton(
                  press: () async {
                    String pickup = "${pDate.toString().substring(0,10)} - $ptime";
                    String receipt = "${rDate.toString().substring(0,10)} - $rtime";
                    int? orderid = await Provider.of<OrderProvider>(context, listen: false).addOrder(
                        location: draggedAddress,
                        pdate: pickup,
                        rdate: receipt,
                        totalprice: totalPrice,
                        idorderstate: 1, orderdate: DateFormat('MMM-dd - kk:mm').format(DateTime.now()));
                    Provider.of<CartProvider>(context,listen: false).addItemsToOrder(orderid!);
                    Get.offAllNamed(Approute.OrderStatusScreen);
                  },
                  title: "Place Order")
            ],
          ),
        ),
      ),
    );
  }
}
