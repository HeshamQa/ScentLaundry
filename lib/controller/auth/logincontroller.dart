// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:scentlaundry/utils/Static/Route.dart';
import '../../utils/Static/consvalue.dart';
import '../../utils/Static/sharedpref.dart';

login(BuildContext context,TextEditingController phone,TextEditingController pass) async {
  EasyLoading.show(status: 'loading...');

  final response = await http.post(
    Uri.parse("${ConsValues.baseurl}login.php"),
    body: {
      "phone": phone.text,
      "password": pass.text
    },
  );
  EasyLoading.dismiss();
  if (response.statusCode == 200) {
    var jsonBody = jsonDecode(response.body);

    if (jsonBody["result"]) {
      General.savePrefInt(ConsValues.id, jsonBody['id']);
      General.savePrefString(ConsValues.NAME, jsonBody['name']);
      General.savePrefString(ConsValues.PHONE, jsonBody['phone']);
      General.savePrefInt(ConsValues.USER_TYPE, jsonBody['idusertype']);
      ConsValues.isLoggedIn=true;
      if (jsonBody['idusertype'] == 1) {
        Get.offAllNamed(Approute.HomeScreen);
      } else if (jsonBody['idusertype'] == 2) {
        Get.offAllNamed(Approute.HomeScreen);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(jsonBody["UserType Error"].toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("OK"))
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(jsonBody["msg"]),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("OK"))
            ],
          );
        },
      );
    }
  }
}