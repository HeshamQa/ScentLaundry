import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:scentlaundry/utils/Static/sharedpref.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../PlaceOrder.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({ Key? key }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}
Completer<GoogleMapController> googleMapController = Completer();
class _LocationScreenState extends State<LocationScreen> {
  CameraPosition? _cameraPosition;
  late LatLng _defaultLatLng;
  late LatLng _draggedLatLng;
  // LocController controller = Get.put(LocController());
  @override
  void initState() {
    _init();
    super.initState();
  }
  _init() {
    _defaultLatLng = const LatLng(11, 104);
    _draggedLatLng = _defaultLatLng;
    _cameraPosition = CameraPosition(
        target: _defaultLatLng,
        zoom: 17.5 // number of map view
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
          children : [
            SizedBox(
                width: getProportionateScreenWidth(375),
                height: getProportionateScreenHeight(600),
                child: GoogleMap(
                  initialCameraPosition: _cameraPosition!,
                  mapType: MapType.normal,
                  onCameraIdle: () {
                    _getAddress(_draggedLatLng);
                  },
                  onCameraMove: (cameraPosition) {
                    _draggedLatLng = cameraPosition.target;
                  },
                  onMapCreated: (GoogleMapController controller) {
                    if (!googleMapController.isCompleted) {
                      googleMapController.complete(controller);
                    }
                  },
                )
            ),
            SizedBox(
              width: getProportionateScreenWidth(375),
              height: getProportionateScreenHeight(600),
              child: Center(
                child: SizedBox(
                  width: getProportionateScreenWidth(150),
                  child: Lottie.asset("assets/images/pin.json"),
                ),
              ),
            ),
          ]
      );
  }
  Future _getAddress(LatLng position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0];
    String addresStr = "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}, ${position.latitude}:${position.longitude}";
    setState(() {
      draggedAddress = addresStr;
      General.savePrefString('lat', position.latitude.toString());
      General.savePrefString('lng', position.longitude.toString());
    });
  }
}
