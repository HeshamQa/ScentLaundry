import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
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
List<QueryDocumentSnapshot> data=[];
getData() async{
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Categories").get();
  data.addAll(querySnapshot.docs);
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData();
    setState(() {});
    super.initState();
  }
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
            const Column(
              children: [
                BannerImage(),
                Categories(),
              ],
            ),
            CustomContainer(
              child: Column(
                children: [
                  const HeaderText(text: "Most Popular"),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  const PopularCategories(),
                  const HeaderText(text: "Subscriptions"),
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