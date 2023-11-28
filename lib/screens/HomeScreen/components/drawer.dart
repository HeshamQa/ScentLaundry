import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/HomeScreen/components/drawer_elements.dart';

import '../../../utils/Static/Size_Config.dart';

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
            text: "Profile"
          ),
          DrawerElements(
            icon: Icons.request_page_outlined,
            text: "Orders"
          ),
          DrawerElements(
            icon: Icons.chat_bubble_outline,
            text: "Contact us"
          ),
          DrawerElements(
            icon: Icons.wallet_outlined,
            text: "Wallet"
          ),
          Spacer(),
          DrawerElements(
            icon: Icons.policy_outlined,
            text: "Terms & policy"
          ),
          DrawerElements(
            icon: Icons.logout_outlined,
            text: "Logout"
          )
        ],
      ),
    );
  }
}