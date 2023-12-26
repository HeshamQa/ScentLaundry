import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../utils/Static/StaticColors.dart';
import 'component/SubBanner.dart';
import 'component/SubBody.dart';

class SubDetails extends StatelessWidget {
  const SubDetails({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("subscribeModel['Item']} ${S.of(context).Items}"),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(children: [
        SubBanner(),
        Expanded(
          child: SubBody(),
        ),
      ]),
    );
  }
}