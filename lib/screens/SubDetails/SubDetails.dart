import 'package:flutter/material.dart';
import 'package:scentlaundry/data/models/SubscribeModel.dart';
import '../../utils/Static/StaticColors.dart';
import 'component/SubBanner.dart';
import 'component/SubBody.dart';

class SubDetails extends StatelessWidget {
  final SubscribeModel subscribeModel;
  const SubDetails({super.key, required this.subscribeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subscribeModel.name),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(children: [
        SubBanner(subscribeModel:subscribeModel,),
        Expanded(
          child: SubBody(subscribeModel: subscribeModel,),
        ),
      ]),
    );
  }
}