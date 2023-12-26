import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import '../../../generated/l10n.dart';
import '../../../utils/Static/Size_Config.dart';
import '../../../utils/Static/StaticColors.dart';
import 'components/BannerImage.dart';
import 'components/Categories.dart';
import 'components/HeaderText.dart';
import 'components/PopularCategories.dart';
import 'components/SubCategories.dart';
import 'components/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo.png",
          width: getProportionateScreenWidth(125),
          fit: BoxFit.fill,
        ),
        actions: [
          IconButton(onPressed: () {
            Get.toNamed(Approute.CartScreen);
          }, icon: const Icon(Icons.shopping_cart))
        ],
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
                  HeaderText(text: S.of(context).MostPopular),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  const PopularCategories(),
                  HeaderText(text: S.of(context).Subscriptions),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  const SubCategories(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}