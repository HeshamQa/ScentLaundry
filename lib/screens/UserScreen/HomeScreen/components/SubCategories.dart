import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/data/remote/SubscribeList.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../SubDetails/SubDetails.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(200),
      child: ListView.builder(
        itemCount: subscribeList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.to(SubDetails(subscribeModel: subscribeList[index]));
          },
          child: Container(
            width: getProportionateScreenWidth(320),
            height: getProportionateScreenHeight(150),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 15, offset: Offset(4, 4))
                ]),
            margin: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: getProportionateScreenHeight(20)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Hero(
                    tag: subscribeList[index].name,
                    child: Image.asset(
                      subscribeList[index].image,
                      width: getProportionateScreenWidth(320),
                      height: getProportionateScreenHeight(105),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                SizedBox(
                    width: getProportionateScreenWidth(275),
                    child: Text(
                      subscribeList[index].name,
                      style: const TextStyle(fontSize: 22),
                    )),
                SizedBox(height: getProportionateScreenHeight(5)),
                SizedBox(
                    width: getProportionateScreenWidth(275),
                    child: Text(
                      "\$${subscribeList[index].price}JOD",
                      style: const TextStyle(fontSize: 20, fontFamily: 'Inter'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
