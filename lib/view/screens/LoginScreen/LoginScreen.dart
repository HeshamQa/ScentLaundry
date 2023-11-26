import 'package:flutter/material.dart';
import 'package:scentlaundry/Size_Config.dart';
import 'package:scentlaundry/view/screens/Widget/TextForm.dart';
import 'Components/BackGround.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextEditingController phoneEditingController=TextEditingController();
    TextEditingController passwordTextEditingController=TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          BackGround(height: getProportionateScreenHeight(406),title: "LogIn"),
          SizedBox(height: getProportionateScreenHeight(15),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(30)),
            child: SizedBox(
              height: getProportionateScreenHeight(150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(textEditingController: phoneEditingController, obscure: false, hint: "Phone"),
                  TextForm(textEditingController: passwordTextEditingController, obscure: true, hint: "Password"),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

