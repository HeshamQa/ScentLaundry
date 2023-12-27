import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/CategoriesModel.dart';
import '../../utils/Static/consvalue.dart';

class PopCateProvider extends ChangeNotifier {
  List<CategoriesModel> listPopCategories = [];

  getPopCate() async {
    listPopCategories.clear();
    final response = await http.get(
      Uri.parse("${ConsValues.baseurl}getpopcate.php"),
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var categories = jsonBody['popcate'];
      for (Map i in categories) {
        listPopCategories.add(CategoriesModel.fromJson(i));
      }
      notifyListeners();
    }
  }
}