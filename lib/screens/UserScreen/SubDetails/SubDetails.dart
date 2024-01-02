import 'package:flutter/material.dart';
import 'package:scentlaundry/models/subscribe_model.dart';
import '../../../generated/l10n.dart';
import '../../../utils/Static/StaticColors.dart';
import 'component/SubBanner.dart';
import 'component/SubBody.dart';

class SubDetails extends StatelessWidget {
  final SubscribeModel subscribeModel;
  const SubDetails({super.key, required this.subscribeModel,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${subscribeModel.count} ${S.of(context).Items}"),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(children: [
        const SubBanner(),
        Expanded(
          child: SubBody(subscribeModel: subscribeModel,),
        ),
      ]),
    );
  }
}