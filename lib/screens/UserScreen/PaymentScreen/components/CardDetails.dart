import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/TextForm.dart';

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextForm(textEditingController: TextEditingController(), obscure: false, hint: 'Card Number', enabled: true),
        SizedBox(width: getProportionateScreenWidth(75),
          child: TextForm(textEditingController: TextEditingController(), obscure: false, hint: 'CVV', enabled: true),
        ),
        Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(40),
              child: TextForm(textEditingController: TextEditingController(), obscure: false, hint: 'YY', enabled: true),
            ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text('/',style: TextStyle(fontSize: 20),),
            ),
            SizedBox(width: getProportionateScreenWidth(40),
              child: TextForm(textEditingController: TextEditingController(), obscure: false, hint: 'MM', enabled: true),
            ),
          ],
        ),
        TextForm(textEditingController: TextEditingController(), obscure: false, hint: 'Card Holder Name', enabled: true),
      ],
    );
  }
}