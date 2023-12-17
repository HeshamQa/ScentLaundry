import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../CategoryScreen/CategoryScreen.dart';
import '../HomeScreen.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(90),
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 15),
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.to(CategoryScreen(data: data, index: index,));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Hero(
                  tag: data[index].id,
                  child: Image.network(
                    data[index]['Image'],
                    fit: BoxFit.cover,
                    width: getProportionateScreenWidth(65),
                    height: getProportionateScreenHeight(60),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: SizedBox(
                      width: getProportionateScreenWidth(60),
                      child: Text(
                        data[index]['Name'],
                        maxLines: 1,
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
