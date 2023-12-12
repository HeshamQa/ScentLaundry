import 'package:flutter/material.dart';

import '../../../utils/Static/StaticColors.dart';

class AddCardButton extends StatelessWidget {
  const AddCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Text('+ Add Card',
          style: TextStyle(color: StaticColors.blue, fontSize: 18)),
    );
  }
}
