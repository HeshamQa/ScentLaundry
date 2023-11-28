import 'package:flutter/material.dart';

import '../../../utils/Static/Size_Config.dart';

class DrawerElements extends StatelessWidget {

  final IconData icon;
  final String text;

  const DrawerElements({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenHeight(10), bottom: getProportionateScreenHeight(10)),
      child: Row(
                children: [
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Icon(icon, size: getProportionateScreenWidth(25),),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Text(text, style: TextStyle(fontSize: getProportionateScreenWidth(18)),)
                ],
              ),
    );
  }
}