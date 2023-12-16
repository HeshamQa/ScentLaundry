import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../utils/Static/Size_Config.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  List<Marker> marker=[];
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(32.53522628114934, 35.86376075756249),
    zoom: 10,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
