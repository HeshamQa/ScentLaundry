import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import '../../../../utils/Static/Size_Config.dart';
import 'drawer_elements.dart';

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
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
          DrawerElements(
            icon: Icons.person_2_outlined,
            text: "Profile",
            ontap: () {
              Get.toNamed(Approute.ProfileScreen);
            },
          ),
          DrawerElements(
            icon: Icons.request_page_outlined,
            text: "Orders",
            ontap: () {
              Get.toNamed(Approute.MyOrder);
            },
          ),
          DrawerElements(
              ontap: () {
                Get.toNamed(Approute.ContactUs);
              },
              icon: Icons.chat_bubble_outline,
              text: "Contact us"),
          DrawerElements(
            icon: Icons.wallet_outlined,
            text: "Wallet",
            ontap: () {
              Get.toNamed(Approute.WalletScreen);
            },
          ),
          DrawerElements(
            icon: Icons.subscriptions_outlined,
            text: "MySubscription",
            ontap: () {
              Get.toNamed(Approute.Subscriptions);
            },
          ),
          const Spacer(),
          DrawerElements(
            icon: Icons.logout_outlined,
            text: "Logout",
            ontap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Approute.Login);
            },
          ),
        ],
      ),
    );
  }
}
