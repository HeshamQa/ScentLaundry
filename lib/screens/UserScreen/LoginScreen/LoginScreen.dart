import 'package:flutter/material.dart';
import 'package:scentlaundry/controller/auth/logincontroller.dart';
import '../../../generated/l10n.dart';
import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Widget/BackGround.dart';
import '../../../utils/Widget/Custom_Button.dart';
import '../../../utils/Widget/TextForm.dart';
import '../ForgetPassword/ForgetPassword.dart';
import 'Components/SignUpButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Hero(
              tag: "logoImage",
              child: BackGround(
                height: getProportionateScreenHeight(315),
                title: S.of(context).LogIn,
                h: 150,
              ),
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
                      textEditingController: phoneEditingController,
                      obscure: false,
                      hint: S.of(context).Phone,
                      enabled: true, type: TextInputType.number,
                    ),
                    TextForm(
                      textEditingController: passwordEditingController,
                      obscure: true,
                      hint: S.of(context).Password,
                      enabled: true, type: TextInputType.text,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const ForgetPassword(),
                        );
                      },
                      child:
                          Text(S.of(context).Forgot, style: const TextStyle(fontSize: 18)),
                    ),
                    CustomButton(
                      press: () async {
                        login(context, phoneEditingController, passwordEditingController);
                      },
                      title: S.of(context).LogIn,
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
