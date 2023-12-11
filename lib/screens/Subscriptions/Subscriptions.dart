import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

class Subscriptions extends StatelessWidget {
  const Subscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscriptions"),
      ),
      body: Scaffold(
          backgroundColor: StaticColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: CustomContainer(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: getProportionateScreenHeight(150),
                    color: Colors.black,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("fa"),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          )),
    );
  }
}
