import 'package:flutter/material.dart';

import '../../../../utils/Static/StaticColors.dart';
import '../../../../utils/Widget/SmallButton.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmallButton(
          press: () {},
          title: "Save",
          color: StaticColors.black,
        ),
        SmallButton(
          press: () {},
          title: "Cancel",
          color: Colors.grey.withOpacity(0.6),
        )
      ],
    );
  }
}
