import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/ProfileScreen/components/Buttons.dart';
import 'package:scentlaundry/screens/ProfileScreen/components/FieldsItems.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import '../../utils/Static/Size_Config.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                child: const Column(
                  children: [
                    FieldsItems(),
                    Spacer(),
                    Buttons(),
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
