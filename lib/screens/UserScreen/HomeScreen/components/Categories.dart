import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/utils/Static/locale_config.dart';
import '../../../../controller/providers/categories.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../CategoryScreen/CategoryScreen.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false).getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(90),
      child: Consumer<CategoriesProvider>(
        builder: (BuildContext context, CategoriesProvider value, Widget? child) => ListView.builder(
          padding: LocaleConfig().isAr?const EdgeInsets.only(right: 15):const EdgeInsets.only(left: 15),
          itemCount: value.listCategoriesModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(CategoryScreen(name: value.listCategoriesModel[index].name, image: value.listCategoriesModel[index].popimage, id: value.listCategoriesModel[index].id,));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Image.network(
                    value.listCategoriesModel[index].image,
                    fit: BoxFit.cover,
                    width: getProportionateScreenWidth(65),
                    height: getProportionateScreenHeight(60),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: SizedBox(
                        width: getProportionateScreenWidth(60),
                        child: Text(
                          LocaleConfig.getCategoryAtIndex(value.listCategoriesModel[index].name,context),
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
      ),
    );
  }
}