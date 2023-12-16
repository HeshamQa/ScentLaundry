import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/Static/Route.dart';
import '../../../../utils/Static/StaticColors.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontFamily: "Inter"),
        ),
        InkWell(
            onTap: () {
              Get.toNamed(Approute.Signup);
            },
            child: Text(
              "Create Now",
              style: TextStyle(
                  color: StaticColors.black, fontSize: 15),
            )),
      ],
    );
  }
}
