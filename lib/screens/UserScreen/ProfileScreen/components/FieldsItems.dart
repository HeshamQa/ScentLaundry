import 'package:flutter/material.dart';
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
          enabled: false,
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
                  TextEditingController(text: phone),
                  obscure: false,
                  hint: "Phone",
                  enabled: false,
                )),
            InkWell(onTap: () {}, child: const Text("Change")),
          ],
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
                  TextEditingController(text: "123123"),
                  obscure: true,
                  hint: "Password",
                  enabled: false,
                )),
            InkWell(onTap: () {}, child: const Text("Change")),
          ],
        ),
      ],
    );
  }
}
