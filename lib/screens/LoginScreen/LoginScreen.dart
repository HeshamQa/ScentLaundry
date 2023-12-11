import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/Static/Route.dart';
import '../../utils/Static/Size_Config.dart';
import '../../utils/Widget/BackGround.dart';
import '../../utils/Widget/Custom_Button.dart';
import '../../utils/Widget/Social_Button.dart';
import '../../utils/Widget/TextForm.dart';
import '../ForgetPassword/ForgetPassword.dart';
import 'Components/SignUpButton.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextEditingController phoneEditingController = TextEditingController();
    TextEditingController passwordTextEditingController =
        TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            BackGround(height: getProportionateScreenHeight(315), title: "LogIn", h: 150,),
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
                        hint: "Phone", enabled: true,),
                    TextForm(
                        textEditingController: passwordTextEditingController,
                        obscure: true,
                        hint: "Password", enabled: true,),
                    InkWell(
                      onTap: () {
                        // Get.toNamed(Approute.ForgetScreen);
                        showModalBottomSheet(context: context, builder: (context) => const ForgetPassword(),);
                      },
                      child:
                          const Text("Forgot?", style: TextStyle(fontSize: 18)),
                    ),
                    CustomButton(
                      press: () {
                        Get.offAllNamed(Approute.HomeScreen);
                      },
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