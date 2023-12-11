
import 'package:flutter/material.dart';

import '../../../utils/Static/Size_Config.dart';

class CustomItems extends StatelessWidget {
  const CustomItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(40)),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          height: getProportionateScreenHeight(85),
          width: getProportionateScreenWidth(375),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black54,blurRadius: 10,spreadRadius: 2)
            ]
          ),
          margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(15),
              vertical: getProportionateScreenHeight(15)),
          child: Row(
            children: [
              Image.asset(
                "assets/images/banner.jpg",
                height: getProportionateScreenHeight(65),
                width: getProportionateScreenWidth(85),
                fit: BoxFit.fill,
              ),
              const Spacer(flex: 1,),
              const Text("T-Shirt",style: TextStyle(fontSize: 20),),
              const Spacer(flex: 2,),
              const Text("1.75JOD",style: TextStyle(fontSize: 16,fontFamily: 'Inter'),),
              const Spacer(flex: 2,),
              const Text("-",style: TextStyle(fontSize: 25),),
              const Spacer(flex: 1,),
              const Text("0",style: TextStyle(fontSize:20),),
              const Spacer(flex: 1,),
              const Text("+",style: TextStyle(fontSize: 25),),
              const Spacer(flex: 1,),
            ],
          ),
        ),
      ),
    );
  }
}
