import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/Static/Route.dart';
import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Widget/BackGround.dart';
import '../../../utils/Widget/Custom_Button.dart';
import '../../../utils/Widget/Social_Button.dart';
import '../../../utils/Widget/TextForm.dart';
import 'components/LogInButton.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();
    TextEditingController userNameEditingController = TextEditingController();
    TextEditingController confirmPasswordTextEditingController = TextEditingController();
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    Future<void> addUser() async {
      return users
          .add({
            "Email": emailTextEditingController.text,
            "Password": passwordTextEditingController.text,
            "UserName": userNameEditingController.text,
          })
          .then((value) => print("user added"))
          .catchError((error) => print("failed to add user: $error"));
    }
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            BackGround(
                height: getProportionateScreenHeight(290),
                title: "Sign Up",
                h: 115),
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
                      textEditingController: userNameEditingController,
                      obscure: false,
                      hint: "User Name",
                      enabled: true,
                    ),
                    TextForm(
                      textEditingController: emailTextEditingController,
                      obscure: false,
                      hint: "Email",
                      enabled: true,
                    ),
                    TextForm(
                      textEditingController: passwordTextEditingController,
                      obscure: true,
                      hint: "Password",
                      enabled: true,
                    ),
                    TextForm(
                      textEditingController:
                          confirmPasswordTextEditingController,
                      obscure: true,
                      hint: "Reset Password",
                      enabled: true,
                    ),
                    CustomButton(
                      title: 'Sign Up',
                      press: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: emailTextEditingController.text,
                            password: passwordTextEditingController.text,
                          );
                          addUser();
                          Get.offAllNamed(Approute.Login);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
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
