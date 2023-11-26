
import 'package:flutter/material.dart';

import '../../../../StaticColors.dart';

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
            onTap: () {},
            child: Text(
              "Create Now",
              style: TextStyle(
                  color: StaticColors.black, fontSize: 15),
            )),
      ],
    );
  }
}
