import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../controller/geo_locator.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../PlaceOrder.dart';
import 'maplocationpicker.dart';

class CurrentLoc extends StatefulWidget {
  const CurrentLoc({super.key});

  @override
  State<CurrentLoc> createState() => _CurrentLocState();
}

class _CurrentLocState extends State<CurrentLoc> {
  @override
  void initState() {
    determinePosition();
    super.initState();
    _init();
  }
  _init() {
    _gotoUserCurrentPosition();
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        _gotoUserCurrentPosition();
      },
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined,size: 30),
          SizedBox(width: getProportionateScreenWidth(10),),
          const Text(
            "Current Location",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Future _gotoUserCurrentPosition() async {
    Position currentPosition = await _determineUserCurrentPosition();
    _gotoSpecificPosition(LatLng(currentPosition.latitude, currentPosition.longitude));
  }

  Future _determineUserCurrentPosition() async {
    LocationPermission locationPermission;
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    //check if user enable service for location permission
    if(!isLocationServiceEnabled) {
      print("user don't enable location permission");
    }

    locationPermission = await Geolocator.checkPermission();

    //check if user denied location and retry requesting for permission
    if(locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied) {
        print("user denied location permission");
      }
    }

    //check if user denied permission forever
    if(locationPermission == LocationPermission.deniedForever) {
      print("user denied permission forever");
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  Future _gotoSpecificPosition(LatLng position) async {
    GoogleMapController mapController = await googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: position,
            zoom: 17.5
        )
    ));
    //every time that we dragged pin , it will list down the address here
    await _getAddress(position);
  }

  Future _getAddress(LatLng position) async {
    //this will list down all address around the position
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark address = placemarks[0]; // get only first and closest address
    String addresStr = "${address.street}, ${address.locality}, ${address.administrativeArea}, ${address.country}";
    setState(() {
      draggedAddress = addresStr;
    });
  }
}
