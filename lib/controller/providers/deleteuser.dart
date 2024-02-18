import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../utils/Static/consvalue.dart';
class DeleteUser extends ChangeNotifier{
  deleteUser(var id) async {
    await http.post(
      Uri.parse("${ConsValues.baseurl}deleteuser.php"),
      body: {
        "id": id,
      },
    );
  }
}