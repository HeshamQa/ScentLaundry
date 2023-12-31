import 'package:flutter/material.dart';
import '../Static/Size_Config.dart';
import '../Static/StaticColors.dart';
class CustomButton extends StatelessWidget {
  final Function() press;
  final String title;
  const CustomButton({
    super.key, required this.press, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(300),
      child: TextButton(
          onPressed: press,
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(StaticColors.black),
              shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)))
          ),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white,fontSize: 19),
          )),
    );
  }
}
