import 'package:flutter/material.dart';
import '../../../Size_Config.dart';
import '../../../StaticColors.dart';
class CustomButton extends StatelessWidget {
  final Function() press;
  final String title;
  const CustomButton({
    super.key, required this.press, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(360),
      child: TextButton(
          onPressed: press,
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(StaticColors.black),
              shape: const MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero))
          ),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white,fontSize: 19),
          )),
    );
  }
}
