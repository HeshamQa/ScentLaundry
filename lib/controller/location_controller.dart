import 'package:get/get.dart';

class LocController extends GetxController{
  RxString address=''.obs;

  setLatLng(String newAddress){
    address.value = newAddress;
  }
}