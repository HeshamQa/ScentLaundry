import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/screens/UserScreen/ChangePassword/ChangePasswordScreen.dart';
import 'package:scentlaundry/utils/Static/consvalue.dart';
import 'package:scentlaundry/utils/Static/sharedpref.dart';

import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/TextForm.dart';

class FieldsItems extends StatefulWidget {
  const FieldsItems({super.key});

  @override
  State<FieldsItems> createState() => _FieldsItemsState();
}

class _FieldsItemsState extends State<FieldsItems> {
  String? name;
  String? phone;
  @override
  initState(){
    super.initState();
    getUserInfo();
  }
  getUserInfo(){
    General.getPrefString(ConsValues.NAME, '').then((value) {setState(() {
      name=value;
    });});
    General.getPrefString(ConsValues.PHONE, '').then((value) {setState(() {
      phone=value;
    });});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextForm(
          textEditingController:
          TextEditingController(text: name),
          obscure: false,
          hint: "User Name",
          enabled: false, type: TextInputType.text,
        ),
        SizedBox(height: getProportionateScreenHeight(15)),
        TextForm(
          textEditingController:
          TextEditingController(text: phone),
          obscure: false,
          hint: "Phone",
          enabled: false, type: TextInputType.number,
        ),
        SizedBox(height: getProportionateScreenHeight(15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
                width: getProportionateScreenWidth(250),
                child: TextForm(
                  textEditingController:
                  TextEditingController(text: "123123123"),
                  obscure: true,
                  hint: "Password",
                  enabled: false, type: TextInputType.text,
                )),
            InkWell(onTap: () {Get.to(()=> const ChangePasswordScreen());}, child: const Text("Change")),
          ],
        ),
      ],
    );
  }
}
