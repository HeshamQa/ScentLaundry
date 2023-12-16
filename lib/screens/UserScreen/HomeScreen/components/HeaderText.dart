
import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(325),
      child: Text(text,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.start),
    );
  }
}