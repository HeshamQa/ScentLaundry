
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/Static/Route.dart';
import '../../../utils/Static/Size_Config.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(200),
      child: ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            Get.toNamed(Approute.SubDetails);
          },
          child: Container(
            width: getProportionateScreenWidth(300),
            height: getProportionateScreenHeight(150),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.grey,blurRadius: 15,offset: Offset(4, 4))
                ]
            ),
            margin: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),bottom: getProportionateScreenHeight(20)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Hero(
                    tag: '1',
                    child: Image.asset(
                      "assets/images/banner.jpg",
                      width: getProportionateScreenWidth(300),
                      height: getProportionateScreenHeight(105),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                SizedBox(
                    width: getProportionateScreenWidth(275),
                    child: const Text("100 Items",style: TextStyle(fontSize: 22),)),
                SizedBox(height: getProportionateScreenHeight(5)),
                SizedBox(
                    width: getProportionateScreenWidth(275),
                    child: const Text("\$75JOD",style: TextStyle(fontSize: 20,fontFamily: 'Inter'),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
