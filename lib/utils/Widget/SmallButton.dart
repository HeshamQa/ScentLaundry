import 'package:flutter/material.dart';
import '../Static/Size_Config.dart';
import '../Static/StaticColors.dart';
class SmallButton extends StatelessWidget {
  final Function() press;
  final String title;
  final Color color;
  const SmallButton({
    super.key, required this.press, required this.title, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: StaticColors.black,width: 2)
      ),
      height: getProportionateScreenHeight(50),
      width: getProportionateScreenWidth(155),
      child: TextButton(
          onPressed: press,
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(color),
              shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero))
          ),
          child: Text(
            title,
            style: TextStyle(color: color==StaticColors.black?Colors.white:StaticColors.black,fontSize: 19),
          )),
    );
  }
}
