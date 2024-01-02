import 'package:flutter/material.dart';
import 'package:scentlaundry/controller/auth/signupcontroller.dart';
import '../../../generated/l10n.dart';
import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Widget/BackGround.dart';
import '../../../utils/Widget/Custom_Button.dart';
import '../../../utils/Widget/TextForm.dart';
import 'components/LogInButton.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneTextEditingController = TextEditingController();
    TextEditingController passwordTextEditingController = TextEditingController();
    TextEditingController nameEditingController = TextEditingController();
    TextEditingController confirmPasswordTextEditingController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            BackGround(
                height: getProportionateScreenHeight(290),
                title: S.of(context).SignUp,
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
                      textEditingController: nameEditingController,
                      obscure: false,
                      hint: S.of(context).UserName,
                      enabled: true,
                    ),
                    TextForm(
                      textEditingController: phoneTextEditingController,
                      obscure: false,
                      hint: S.of(context).Phone,
                      enabled: true,
                    ),
                    TextForm(
                      textEditingController: passwordTextEditingController,
                      obscure: true,
                      hint: S.of(context).Password,
                      enabled: true,
                    ),
                    TextForm(
                      textEditingController:
                          confirmPasswordTextEditingController,
                      obscure: true,
                      hint: S.of(context).ResetPassword,
                      enabled: true,
                    ),
                    CustomButton(
                      title: S.of(context).SignUp,
                      press: () {
                        passwordTextEditingController.text==confirmPasswordTextEditingController.text?signup(context, nameEditingController, phoneTextEditingController, passwordTextEditingController):showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Sign Up Error'),
                            content: const Text('The Passwords is deference'),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        );
                      },
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
