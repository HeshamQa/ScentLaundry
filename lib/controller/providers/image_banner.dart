  import 'dart:convert';

  import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
  import 'package:http/http.dart' as http;
  import 'package:scentlaundry/models/image_banner.dart';
  import '../../utils/Static/consvalue.dart';

  class ImageBannerProvider extends ChangeNotifier {
    List<ImageBannerModel> listImageBannerModel = [];

    getBannerImages() async {
      listImageBannerModel.clear();
      EasyLoading.show(status: 'loading...');
      final response =
      await http.get(Uri.parse("${ConsValues.baseurl}getimagebanner.php"));
      EasyLoading.dismiss();
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        var bannerImages = jsonBody['imagebanner'];
        for (var i in bannerImages) {
          listImageBannerModel.add(ImageBannerModel.fromJson(i));
        }
        notifyListeners();
      }
    }
  }