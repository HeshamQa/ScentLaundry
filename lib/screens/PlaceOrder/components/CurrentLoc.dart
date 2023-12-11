import 'package:flutter/material.dart';

import '../../../utils/Static/Size_Config.dart';

class CurrentLoc extends StatelessWidget {
  const CurrentLoc({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined,size: 30),
          SizedBox(width: getProportionateScreenWidth(10),),
          const Text(
            "Current Location",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
