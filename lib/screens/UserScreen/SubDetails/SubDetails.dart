import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../utils/Static/StaticColors.dart';
import 'component/SubBanner.dart';
import 'component/SubBody.dart';

class SubDetails extends StatelessWidget {
  final QueryDocumentSnapshot subscribeModel;
  const SubDetails({super.key, required this.subscribeModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${subscribeModel['Item']} Items'),
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