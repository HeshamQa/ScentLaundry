import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Static/locale_config.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, });

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleConfig.getCategoryAtIndex(
            "widget.data[widget.index]['Name']",
            context) ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          // Baner(data: widget.data, index: widget.index,),
          // Expanded(
            // child: CustomContainer(
                // child: CustomItems(data: subCate,cateName:widget.data[widget.index]['Name'])
            // ),
          // ),
        ],
      ),
    );
  }
}
