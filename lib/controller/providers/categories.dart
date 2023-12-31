import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/categories_model.dart';
import '../../utils/Static/consvalue.dart';

class CategoriesProvider extends ChangeNotifier {
  List<CategoriesModel> listCategoriesModel = [];

  getCategories() async {
    listCategoriesModel.clear();
    final response = await http.get(
      Uri.parse("${ConsValues.baseurl}getcategories.php"),
    );
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var categories = jsonBody['categories'];
      for (Map i in categories) {
        listCategoriesModel.add(CategoriesModel.fromJson(i));
      }
      notifyListeners();
    }
  }
}