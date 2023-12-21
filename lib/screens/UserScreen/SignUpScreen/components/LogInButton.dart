import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/StaticColors.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).Doyouhaveanaccount,
          style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontFamily: "Inter"),
        ),
        InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              S.of(context).LogIn,
              style: TextStyle(
                  color: StaticColors.black, fontSize: 15),
            )),
      ],
    );
  }
}
