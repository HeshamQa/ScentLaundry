import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Static/locale_config.dart';

import '../../../utils/Widget/Custom_Container.dart';
import 'components/Banner.dart';
import 'components/CustomItems.dart';


class CategoryScreen extends StatelessWidget {
  final String name;
  final String image;
  var id;
  CategoryScreen({super.key, required this.name, required this.image, required this.id, });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleConfig.getCategoryAtIndex(name,context) ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          Baner(image: image),
          Expanded(
            child: CustomContainer(
                child: CustomItems(id: id,)
            ),
          ),
        ],
      ),
    );
  }
}
