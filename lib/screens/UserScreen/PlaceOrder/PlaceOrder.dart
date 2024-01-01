import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/UserScreen/PlaceOrder/components/maplocationpicker.dart';
import 'components/BottomContainer.dart';
import 'components/CustomAppBar.dart';
class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}
String draggedAddress = "";
class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LocationScreen(),
            Column(
              children: [
                CustomAppBar(),
                Spacer(),
                BottomContainer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
