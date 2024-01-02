import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scentlaundry/models/item_model.dart';
import 'package:http/http.dart' as http;

import '../../utils/Static/consvalue.dart';

class ItemProvider extends ChangeNotifier {
  List<ItemModel> listItem = [];

  getItem(var idcategories) async {
    listItem.clear();
    final response = await http.post(
      Uri.parse("${ConsValues.baseurl}getitem.php"),
      body: {
        "idcategories": idcategories,
      },
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var item = jsonBody['item'];
      for (Map i in item) {
        listItem.add(ItemModel.fromJson(i));
      }
      notifyListeners();
    }
  }
}
