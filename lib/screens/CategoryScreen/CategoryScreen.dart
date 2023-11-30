import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/CategoryScreen/components/Banner.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import 'components/AddToCartButton.dart';
import 'components/CustomItems.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Name"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
      ),
      backgroundColor: StaticColors.primaryColor,
      body: const Column(
        children: [
          Baner(),
          Expanded(
            child: CustomContainer(
                child: Stack(
                  children: [
                    CustomItems(),
                    AddToCartButton(),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
