import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/HomeScreen/components/HeaderText.dart';
import 'package:scentlaundry/screens/HomeScreen/components/PopularCategories.dart';
import 'package:scentlaundry/screens/HomeScreen/components/drawer.dart';
import 'package:scentlaundry/screens/HomeScreen/components/drawer_elements.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import '../../utils/Static/Size_Config.dart';
import '../../utils/Static/StaticColors.dart';
import 'components/BannerImage.dart';
import 'components/Categories.dart';
import 'components/SubCategories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          "assets/images/logo.png",
          width: getProportionateScreenWidth(125),
          fit: BoxFit.fill,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        backgroundColor: StaticColors.primaryColor,
      ),
      drawer: const CustomDrawer(),
      backgroundColor: StaticColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BannerImage(),
            const Categories(),
            CustomContainer(
              child: Column(
                children: [
                  const HeaderText(text: "Most Popular"),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  const PopularCategories(),
                  const HeaderText(text: "Subscriptions"),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  const SubCategories()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}