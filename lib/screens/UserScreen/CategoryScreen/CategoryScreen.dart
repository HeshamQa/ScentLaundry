import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import 'components/AddToCartButton.dart';
import 'components/Banner.dart';
import 'components/CustomItems.dart';

class CategoryScreen extends StatelessWidget {
  final List<QueryDocumentSnapshot> data;
  final int index;
  const CategoryScreen({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Name"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          const Baner(),
          Expanded(
            child: CustomContainer(
                child: Stack(
                  children: [
                    CustomItems(data: data, cindex: index,),
                    const AddToCartButton(),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
