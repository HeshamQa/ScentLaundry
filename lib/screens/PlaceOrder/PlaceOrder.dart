import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
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
  List<Marker> marker=[];
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.53522628114934, 35.86376075756249),
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(375),
              height: getProportionateScreenHeight(500),
              child: GoogleMap(
                markers: marker.toSet(),
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onTap: (argument) {
                  marker.add(Marker(markerId: const MarkerId('0'),position: LatLng(argument.latitude, argument.longitude)));
                  setState(() {});
                },
              ),
            ),
            Column(
              children: [
                Padding(
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
                ),
                const Spacer(),
                const BottomContainer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}