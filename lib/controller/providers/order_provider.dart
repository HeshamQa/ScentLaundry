import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:scentlaundry/models/order_model.dart';
import '../../utils/Static/consvalue.dart';
import '../../utils/Static/sharedpref.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> orderList=[];
  getOrder() async {
    EasyLoading.show(status: 'loading...');
    orderList = [];
    General.getPrefInt(ConsValues.id, 0).then(
          (iduser) async {
        final response = await http.post(
          Uri.parse(
            "${ConsValues.baseurl}getorder.php",
          ),
          body: {
            "iduser": iduser.toString(),
          },
        );
        EasyLoading.dismiss();
        if (response.statusCode == 200) {
          var jsonBody = jsonDecode(response.body);
          var orders = jsonBody['orders'];
          for (Map<String,dynamic> i in orders) {
            orderList.add(OrderModel.fromJson(i));
          }
          notifyListeners();
        }
      },
    );
  }

  Future<int?> addOrder({required var location, required var pdate, required var rdate, required var totalprice, required var idorderstate,required var orderdate}) async {
    EasyLoading.show(status: 'loading...');
    var orderId;

    try {
      await General.getPrefInt(ConsValues.id, 0).then((iduser) async {
        var response = await http.post(
          Uri.parse("${ConsValues.baseurl}addorder.php"),
          body: {
            "iduser": iduser.toString(),
            "location": location.toString(),
            "pdate": pdate.toString(),
            "rdate": rdate.toString(),
            "totalprice": totalprice.toString(),
            "idorderstate": idorderstate.toString(),
            "orderdate": orderdate.toString(),
          },
        );

        if (response.statusCode == 200) {
          var data = json.decode(response.body);
          if (data['status'] == 'success') {
            orderId = data['orderId']; // Get the order ID from the response
          } else {
            // Handle error
          }
        } else {
          // Handle HTTP error
        }
      });
    } catch (e) {
      // Handle exception
    }

    EasyLoading.dismiss();
    return orderId;
  }
}
