import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import 'package:scentlaundry/utils/Widget/SmallButton.dart';
import 'package:scentlaundry/utils/Widget/TextForm.dart';

import '../../../utils/Static/Size_Config.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          const Icon(CupertinoIcons.profile_circled, size: 150),
          Expanded(
            child: CustomContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                    vertical: getProportionateScreenHeight(15)),
                child: Column(
                  children: [
                    TextForm(
                      textEditingController: TextEditingController(),
                      obscure: true,
                      hint: "Current Password",
                      enabled: true,
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    SizedBox(
                      width: getProportionateScreenWidth(250),
                      child: TextForm(
                        textEditingController: TextEditingController(),
                        obscure: true,
                        hint: "New Password",
                        enabled: true,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(15)),
                    SizedBox(
                      width: getProportionateScreenWidth(250),
                      child: TextForm(
                        textEditingController: TextEditingController(),
                        obscure: true,
                        hint: "Confirm Password",
                        enabled: true,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmallButton(
                          press: () {},
                          title: "Save",
                          color: StaticColors.black,
                        ),
                        SmallButton(
                          press: () {},
                          title: "Cancel",
                          color: Colors.grey.withOpacity(0.6),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
