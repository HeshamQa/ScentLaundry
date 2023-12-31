import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/consvalue.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Static/sharedpref.dart';
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
            text: S.of(context).Profile,
            ontap: () {
              Get.toNamed(Approute.ProfileScreen);
            },
          ),
          DrawerElements(
            icon: Icons.request_page_outlined,
            text: S.of(context).Orders,
            ontap: () {
              Get.toNamed(Approute.MyOrder);
            },
          ),
          DrawerElements(
              ontap: () {
                Get.toNamed(Approute.ContactUs);
              },
              icon: Icons.chat_bubble_outline,
              text: S.of(context).Contactus),
          DrawerElements(
            icon: Icons.wallet_outlined,
            text: S.of(context).Wallet,
            ontap: () {
              Get.toNamed(Approute.WalletScreen);
            },
          ),
          DrawerElements(
            icon: Icons.subscriptions_outlined,
            text: S.of(context).MySubscription,
            ontap: () {
              Get.toNamed(Approute.Subscriptions);
            },
          ),
          const Spacer(),
          DrawerElements(
            icon: Icons.logout_outlined,
            text: S.of(context).Logout,
            ontap: () async {
              General.remove(ConsValues.id);
              General.remove(ConsValues.NAME);
              General.remove(ConsValues.PHONE);
              General.remove(ConsValues.USER_TYPE);
              ConsValues.isLoggedIn=false;
              Get.offAllNamed(Approute.Login);
            },
          ),
        ],
      ),
    );
  }
}
