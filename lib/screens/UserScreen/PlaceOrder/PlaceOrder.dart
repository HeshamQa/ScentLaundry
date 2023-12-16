import 'package:flutter/material.dart';
import 'components/BottomContainer.dart';
import '../../../controller/GeoLocator.dart';
import 'components/CustomAppBar.dart';
import 'components/MapWidget.dart';
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