import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scentlaundry/models/SubscribeModel.dart';
import '../../utils/Static/consvalue.dart';

class SubscribeProvider extends ChangeNotifier {
  List<SubscribeModel> listSub = [];

  getSubscription() async {
    listSub.clear();
    final response = await http.get(
      Uri.parse("${ConsValues.baseurl}getsubscribe.php"),
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var sub = jsonBody['subscriptions'];
      for (Map i in sub) {
        listSub.add(SubscribeModel.fromJson(i));
      }
      notifyListeners();
    }
  }
}