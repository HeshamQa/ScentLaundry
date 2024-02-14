import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart'as http;
import 'package:scentlaundry/models/admin_models/order_det_model.dart';
import 'package:scentlaundry/models/admin_models/order_model.dart';

import '../../utils/Static/consvalue.dart';

class AdminOrderProvider extends ChangeNotifier{
  List<OrderAdminModel> order=[];
  List<OrderDetModel> orderDet=[];
  getAllOrders() async {
    order.clear();
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse(
        "${ConsValues.baseurl}getallorders.php",
      ),
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var cart = jsonBody['orders'];
      for (Map<String,dynamic> i in cart) {
        order.add(OrderAdminModel.fromJson(i));
      }
      notifyListeners();
    }
  }
  getOrderDet(var id) async {
    orderDet.clear();
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse(
        "${ConsValues.baseurl}getorderdet.php"),
        body:{
          "idorder":id.toString()
        }
    );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var cart = jsonBody['orderDetails'];
      for (Map<String,dynamic> i in cart) {
        orderDet.add(OrderDetModel.fromJson(i));
      }
      notifyListeners();
    }
  }
  updateOrderStatus(var id,var status) async {
    EasyLoading.show(status: 'loading...');
    await http.post(
      Uri.parse("${ConsValues.baseurl}updateorderstate.php"),
      body: {
        "id": id,
        "idorderstate": status.toString(),
      },
    );
    EasyLoading.dismiss();
    notifyListeners();
  }
}