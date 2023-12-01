import 'package:flutter/material.dart';

import '../../utils/Static/Size_Config.dart';
import '../../utils/Widget/BackGround.dart';
import '../../utils/Widget/Custom_Button.dart';
import '../../utils/Widget/Social_Button.dart';
import '../../utils/Widget/TextForm.dart';
import 'components/LogInButton.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            BackGround(
                height: getProportionateScreenHeight(290), title: "Sign Up",h: 115),
            SizedBox(height: getProportionateScreenHeight(15)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenHeight(30)),
              child: SizedBox(
                height: getProportionateScreenHeight(470),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextForm(
                        textEditingController: phoneEditingController,
                        obscure: false,
                        hint: "User Name", enabled: true,),
                    TextForm(
                        textEditingController: phoneEditingController,
                        obscure: false,
                        hint: "Phone", enabled: true,),
                    TextForm(
                        textEditingController: passwordTextEditingController,
                        obscure: true,
                        hint: "Password", enabled: true,),
                    TextForm(
                        textEditingController: passwordTextEditingController,
                        obscure: true,
                        hint: "Reset Password", enabled: true,),
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
                    const LogInButton(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
