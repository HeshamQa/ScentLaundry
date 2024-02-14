import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:scentlaundry/models/admin_models/admin_sub_model.dart';
import 'package:http/http.dart' as http;

import '../../utils/Static/consvalue.dart';

class AdminSubProvider extends ChangeNotifier{
  List<AdminSubModel2> subModel=[];
  List<AdminSubModel> subModel2=[];
  getSubModel() async {
    subModel2.clear();
    EasyLoading.show(status: 'loading...');
        final response = await http.post(
          Uri.parse(
            "${ConsValues.baseurl}getadminsub.php",
          ),
        );
        EasyLoading.dismiss();
        if (response.statusCode == 200) {
          var jsonBody = jsonDecode(response.body);
          var cart = jsonBody['subscriptions'];
          for (Map<String,dynamic> i in cart) {
            subModel2.add(AdminSubModel.fromJson(i));
          }
          notifyListeners();
        }
  }

  getAllSub() async {
    subModel.clear();
    EasyLoading.show(status: 'loading...');
    final response = await http.post(
      Uri.parse(
        "${ConsValues.baseurl}getallsub.php"),
      );
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var cart = jsonBody['subscriptions'];
      for (Map<String,dynamic> i in cart) {
        subModel.add(AdminSubModel2.fromJson(i));
      }
      notifyListeners();
    }
  }
  acceptMySub(String id) async {
    EasyLoading.show(status: 'loading...');
    await http.post(
      Uri.parse("${ConsValues.baseurl}acceptmysub.php"),
      body: {
        "id": id,
      },
    );
    EasyLoading.dismiss();
    notifyListeners();
  }
  deleteMySub(var id) async {
    await http.post(
      Uri.parse("${ConsValues.baseurl}deletemysub.php"),
      body: {
        "id": id,
      },
    );
  }

  updateCount(var id,var count) async {
    EasyLoading.show(status: 'loading...');
    await http.post(
      Uri.parse("${ConsValues.baseurl}updatemysub.php"),
      body: {
        "id": id,
        "count": count.toString(),
      },
    );
    EasyLoading.dismiss();
    notifyListeners();
  }
}