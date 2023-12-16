import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/TextForm.dart';

class FieldsItems extends StatelessWidget {
  const FieldsItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextForm(
          textEditingController:
          TextEditingController(text: "Hesham Ahmed AlQaoud"),
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
                  TextEditingController(text: "0788828337"),
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
