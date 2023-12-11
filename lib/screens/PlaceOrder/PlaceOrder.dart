import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/PlaceOrder/components/CustomAppBar.dart';
import 'package:scentlaundry/screens/PlaceOrder/components/MapWidget.dart';
import 'components/BottomContainer.dart';
import '../../../controller/GeoLocator.dart';
class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  void initState() {
    determinePosition();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            MapWidget(),
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