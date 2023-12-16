import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/Static/Route.dart';
import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Widget/BackGround.dart';
import '../../../utils/Widget/Custom_Button.dart';
import '../../../utils/Widget/Social_Button.dart';
import '../../../utils/Widget/TextForm.dart';
import '../ForgetPassword/ForgetPassword.dart';
import 'Components/SignUpButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            BackGround(
              height: getProportionateScreenHeight(315),
              title: "LogIn",
              h: 150,
            ),
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
                      textEditingController: emailEditingController,
                      obscure: false,
                      hint: "Email",
                      enabled: true,
                    ),
                    TextForm(
                      textEditingController: passwordEditingController,
                      obscure: true,
                      hint: "Password",
                      enabled: true,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const ForgetPassword(),
                        );
                      },
                      child:
                          const Text("Forgot?", style: TextStyle(fontSize: 18)),
                    ),
                    CustomButton(
                      press: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: emailEditingController.text,
                            password: passwordEditingController.text,
                          );
                          Get.offAllNamed(Approute.HomeScreen);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print(
                                '======================No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print(
                                '======================Wrong password provided for that user.');
                          }
                        }
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
