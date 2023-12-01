import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import 'package:scentlaundry/utils/Widget/SmallButton.dart';
import 'package:scentlaundry/utils/Widget/TextForm.dart';

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
          Icon(CupertinoIcons.profile_circled,size: 150),
          Expanded(
              child:CustomContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25),vertical: getProportionateScreenHeight(15)),
                  child: Column(
                    children: [
                      TextForm(textEditingController: TextEditingController(text: "Hesham Ahmed AlQaoud"), obscure: false, hint: "User Name", enabled: false,),
                      SizedBox(height: getProportionateScreenHeight(15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: getProportionateScreenWidth(250),
                              child: TextForm(textEditingController: TextEditingController(text: "0788828337"), obscure: false, hint: "Phone", enabled: false,)),
                          InkWell(
                              onTap: (){},
                              child: const Text("Change")),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(15)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: getProportionateScreenWidth(250),
                              child: TextForm(textEditingController: TextEditingController(text: "123123"), obscure: true, hint: "Password", enabled: false,)),
                          InkWell(
                              onTap: (){},
                              child: const Text("Change")),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallButton(press: (){}, title: "Save", color: StaticColors.black,),
                          SmallButton(press: (){}, title: "Cancel",color: Colors.grey,)
                        ],
                      )
                    ],
                  ),
                ),
              )

          )
        ],
      ),
    );
  }
}
