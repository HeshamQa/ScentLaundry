import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Widget/Custom_Button.dart';
import '../../../utils/Widget/TextForm.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneEditingController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
          // BackGround(height: getProportionateScreenHeight(300), title: "Forget\nPassword", h: 100),
          Text(S.of(context).ForgetPassword, style: TextStyle(fontSize: 22)),
          SizedBox(height: getProportionateScreenHeight(60)),
          TextForm(
              textEditingController: phoneEditingController,
              obscure: false,
              hint: S.of(context).EnterEmail, enabled: true,),
          SizedBox(height: getProportionateScreenHeight(30)),
          CustomButton(press: () {}, title: S.of(context).Next),
        ],
      ),
    );
  }
}
