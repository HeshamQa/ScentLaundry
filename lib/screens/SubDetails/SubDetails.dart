import 'package:flutter/material.dart';
import '../../utils/Static/StaticColors.dart';
import 'component/SubBanner.dart';
import 'component/SubBody.dart';

class SubDetails extends StatelessWidget {
  const SubDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("100 Item"),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: const Column(children: [
        SubBanner(),
        Expanded(
          child: SubBody(),
        ),
      ]),
    );
  }
}