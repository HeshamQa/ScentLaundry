import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        const Text(
          "Do you have an account? ",
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontFamily: "Inter"),
        ),
        InkWell(
            onTap: () {
              Get.back();
            },
            child: Text(
              "Login",
              style: TextStyle(
                  color: StaticColors.black, fontSize: 15),
            )),
      ],
    );
  }
}
