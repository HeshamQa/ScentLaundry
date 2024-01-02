import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import '../../../generated/l10n.dart';
import 'components/SubBuilder.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).MySubscription),
      ),
      body: Scaffold(
          backgroundColor: StaticColors.primaryColor,
          body: Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
            child: const CustomContainer(
                child: SubBuilder(),
            ),
          )),
    );
  }
}
