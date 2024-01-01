import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/UserScreen/ProfileScreen/components/profileimage_imagepicker.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import '../../../utils/Static/Size_Config.dart';
import 'components/Buttons.dart';
import 'components/FieldsItems.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          const ProfileImagePicker(),
          SizedBox(height: getProportionateScreenHeight(25),),
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
