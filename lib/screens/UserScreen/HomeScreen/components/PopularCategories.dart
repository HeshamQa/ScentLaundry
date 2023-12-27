import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/utils/Static/locale_config.dart';
import '../../../../controller/providers/PopCate.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../CategoryScreen/CategoryScreen.dart';

class PopularCategories extends StatefulWidget {
  const PopularCategories({
    super.key,
  });

  @override
  State<PopularCategories> createState() => _PopularCategoriesState();
}

class _PopularCategoriesState extends State<PopularCategories> {
  @override
  initState() {
    Provider.of<PopCateProvider>(context, listen: false).getPopCate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: LocaleConfig().isAr
          ? EdgeInsets.only(left: getProportionateScreenWidth(25))
          : EdgeInsets.only(right: getProportionateScreenWidth(25)),
      child: Consumer<PopCateProvider>(
        builder: (context, value, child) => GridView.builder(
            itemCount: value.listPopCategories.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(CategoryScreen(
                    image: value.listPopCategories[index].popimage,
                    name: value.listPopCategories[index].name,
                    id: value.listPopCategories[index].id,
                  ));
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                      child: Image.network(
                        value.listPopCategories[index].popimage,
                        width: getProportionateScreenWidth(150),
                        height: getProportionateScreenHeight(150),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(150),
                      alignment: Alignment.center,
                      color: Colors.black45,
                      child: Text(
                        LocaleConfig.getCategoryAtIndex(
                            value.listPopCategories[index].name, context),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              );
            },
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2)),
      ),
    );
  }
}
