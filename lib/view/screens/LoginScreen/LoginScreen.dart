import 'package:flutter/material.dart';
import 'package:scentlaundry/Size_Config.dart';
import 'package:scentlaundry/view/screens/Widget/Social_Button.dart';
import 'package:scentlaundry/view/screens/Widget/TextForm.dart';
import '../Widget/Custom_Button.dart';
import 'Components/BackGround.dart';
import 'Components/SignUpButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextEditingController phoneEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          BackGround(height: getProportionateScreenHeight(350), title: "LogIn"),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(30)),
            child: SizedBox(
              height: getProportionateScreenHeight(435),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(
                      textEditingController: phoneEditingController,
                      obscure: false,
                      hint: "Phone"),
                  TextForm(
                      textEditingController: passwordTextEditingController,
                      obscure: true,
                      hint: "Password"),
                  InkWell(
                    onTap: () {},
                    child:
                        const Text("Forgot?", style: TextStyle(fontSize: 18)),
                  ),
                  CustomButton(
                    press: () {},
                    title: 'Log In',
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Or Continue with",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SocialButton(
                          title: "Google",
                          image: "assets/icons/google-icon.svg"),
                      SocialButton(
                        title: "Facebook",
                        image: "assets/icons/facebook-2.svg",
                      )
                    ],
                  ),
                  const SignUpButton(),
                  const SizedBox(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}