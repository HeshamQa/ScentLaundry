import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import '../../../utils/Static/Size_Config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(110),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: 1,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.toNamed(Approute.CategoryScreen);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Hero(
                  tag: "123",
                  child: Image.asset(
                    "assets/images/banner.jpg",
                    fit: BoxFit.cover,
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: const Text(
                        "Categories Name",
                        maxLines: 2,
                        // categoriesModelList[index].name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 13),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
