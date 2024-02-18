import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/deleteuser.dart';
import 'package:scentlaundry/screens/UserScreen/ProfileScreen/components/profileimage_imagepicker.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Static/consvalue.dart';
import '../../../utils/Static/sharedpref.dart';
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
          SizedBox(
            height: getProportionateScreenHeight(25),
          ),
          Expanded(
            child: CustomContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                    vertical: getProportionateScreenHeight(15)),
                child: Column(
                  children: [
                    const FieldsItems(),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          const Text("if you want to delete your account "),
                          InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Delete Your Account?"),
                                    actions: [
                                      IconButton(
                                          onPressed: () {
                                            General.getPrefInt(ConsValues.id, 0)
                                                .then((iduser) async {
                                              Provider.of<DeleteUser>(context,
                                                  listen: false)
                                                  .deleteUser(iduser);
                                            });
                                            Get.toNamed(Approute.Login);
                                          },
                                          icon: const Text('Approve')),
                                      IconButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          icon: const Text('Cancel')),
                                    ],
                                  ),
                                );
                              },
                              child: const Text(
                                "CLICK HERE",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                    ),
                    const Buttons(),
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
