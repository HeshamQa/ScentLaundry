import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/data/remote/CategoriesList.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import '../../../utils/Static/Size_Config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(90),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: categoriesList.length,
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
                  tag: categoriesList[index].image,
                  child: Image.asset(
                    categoriesList[index].image,
                    fit: BoxFit.fill,
                    width: getProportionateScreenWidth(65),
                    height: getProportionateScreenHeight(60),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: Text(
                        categoriesList[index].name,
                        maxLines: 2,
                        // categoriesModelList[index].name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
