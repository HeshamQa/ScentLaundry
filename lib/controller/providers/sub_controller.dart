import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:scentlaundry/models/mysub_model.dart';
import '../../utils/Static/consvalue.dart';
import '../../utils/Static/sharedpref.dart';

class SubController extends ChangeNotifier{
  List<MySubModel> mySub=[];
  addSub({required var idsub,required var count}) async {
    EasyLoading.show(status: 'loading...');
    General.getPrefInt(ConsValues.id, 0).then(
          (iduser) async {
        await http.post(
          Uri.parse("${ConsValues.baseurl}addmysub.php"),
          body: {
            "iduser": iduser.toString(),
            "idsub": idsub.toString(),
            "count" : count.toString(),
          },
        );
        EasyLoading.dismiss();
      },
    );
  }
  getMySub() async {
    mySub.clear();
    EasyLoading.show(status: 'loading...');
    General.getPrefInt(ConsValues.id, 0).then(
          (iduser) async {
        final response = await http.post(
          Uri.parse(
            "${ConsValues.baseurl}getmysub.php",
          ),
          body: {
            "iduser": iduser.toString(),
          },
        );
        EasyLoading.dismiss();
        if (response.statusCode == 200) {
          var jsonBody = jsonDecode(response.body);
          var cart = jsonBody['subscriptions'];
          for (Map i in cart) {
            mySub.add(MySubModel.fromJson(i));
            }
          notifyListeners();
        }
      },
    );
  }
}