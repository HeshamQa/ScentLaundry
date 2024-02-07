import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  String _address = '';

  String get address => _address;

  void setAddress(String newAddress) {
    _address = newAddress;
    notifyListeners();
  }
}
