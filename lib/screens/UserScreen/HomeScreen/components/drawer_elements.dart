import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';

class DrawerElements extends StatelessWidget {

  final IconData icon;
  final String text;
  final Function() ontap;
  DrawerElements({super.key, required this.icon, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenHeight(10), bottom: getProportionateScreenHeight(10)),
      child: InkWell(
        onTap: ontap,
        child: Row(
                  children: [
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Icon(icon, size: getProportionateScreenWidth(25),),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Text(text, style: TextStyle(fontSize: getProportionateScreenWidth(18)),)
                  ],
                ),
      ),
    );
  }
}