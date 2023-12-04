import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/screens/HomeScreen/components/drawer_elements.dart';
import 'package:scentlaundry/utils/Static/Route.dart';

import '../../../utils/Static/Size_Config.dart';
/// AIzaSyC9bcB4IHxPf_RkQQJ-CyxbDkaztK8ui1I
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: getProportionateScreenWidth(200),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(50),),
          DrawerElements(
            icon: Icons.person_2_outlined,
            text: "Profile", ontap: (){Get.toNamed(Approute.ProfileScreen);},
          ),
          DrawerElements(
            icon: Icons.request_page_outlined,
            text: "Orders", ontap: (){},
          ),
          DrawerElements(
            ontap: (){},
            icon: Icons.chat_bubble_outline,
            text: "Contact us"
          ),
           DrawerElements(
            icon: Icons.wallet_outlined,
            text: "Wallet", ontap: (){},
          ),
           DrawerElements(icon: Icons.subscriptions_outlined, text:"MySubscription", ontap: (){},),
          const Spacer(),
           DrawerElements(
            icon: Icons.policy_outlined,
            text: "Terms & policy", ontap: (){},
          ),
           DrawerElements(
            icon: Icons.logout_outlined,
            text: "Logout", ontap: (){},
          ),

        ],
      ),
    );
  }
}