import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/dragged_adress_provider.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../PlaceOrder.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({ Key? key }) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}
late LatLng latLng;
final Polygon irbidPolygon = Polygon(
  polygonId: const PolygonId('irbid'),
  points: const [
    LatLng(32.50113241, 35.848599560),
    LatLng(32.47823145, 35.879077836),
    LatLng(32.46995581, 35.914091393),
    LatLng(32.50658483, 35.933626927),
    LatLng(32.57526895, 35.910103619),
    LatLng(32.56885778, 35.838627442),
    LatLng(32.54486532, 35.826566889),
  ],
  strokeWidth: 2,
  strokeColor: StaticColors.primaryColor,
  fillColor: StaticColors.primaryColor.withOpacity(0.5),
);
Completer<GoogleMapController> googleMapController = Completer();
class _LocationScreenState extends State<LocationScreen> {
  CameraPosition? _cameraPosition;
  LatLng _defaultLatLng = const LatLng(0, 0);
  LatLng _draggedLatLng=const LatLng(0, 0);

  @override
  void initState() {
    _initCurrentLocation();
    super.initState();
  }

  Future<void> _initCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();
    _defaultLatLng = LatLng(position.latitude, position.longitude);
    _draggedLatLng = _defaultLatLng;
    _cameraPosition = CameraPosition(
      target: _defaultLatLng,
      zoom: 17.5, // Adjust the zoom level as needed
    );

    if (googleMapController.isCompleted) {
      final GoogleMapController controller = await googleMapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
    }

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return _cameraPosition!=null?Stack(
          children : [
            SizedBox(
                width: getProportionateScreenWidth(375),
                height: getProportionateScreenHeight(600),
                child: GoogleMap(
                  polygons: {irbidPolygon},
                  initialCameraPosition: _cameraPosition!,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
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
      ):const Center(child: CircularProgressIndicator());
  }
  Future _getAddress(LatLng position) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placeMarks[0];
    latLng = position;
    String addressStr = "${position.latitude},${position.longitude}";
    String addressPrinter="${address.street}, ${address.locality}, ${address.country},";
    setState(() {
      draggedAddress=addressStr;
      Provider.of<AddressProvider>(context, listen: false).setAddress(addressPrinter);
    });
  }
}
