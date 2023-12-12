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
        title: const Text("Subscriptions"),
      ),
      body: Scaffold(
          backgroundColor: StaticColors.primaryColor,
          body: Padding(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(50)),
            child: CustomContainer(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(color: Colors.black54,blurRadius: 10,offset: Offset(2, 2),spreadRadius: 2),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text("Items: 75/100",style: TextStyle(fontSize: 20)),
                            Spacer(),
                            Text('75JOD',style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        const Text('T-Shirt - Pants - Short - underwear -  Sucks - shoes',style: TextStyle(fontSize: 17,fontFamily: 'reg'))
                      ],
                    ),
                  ),
                )),
          )),
    );
  }
}
