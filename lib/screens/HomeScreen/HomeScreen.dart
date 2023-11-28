import 'package:flutter/material.dart';
import '../../utils/Static/Size_Config.dart';
import '../../utils/Static/StaticColors.dart';
import 'components/BannerImage.dart';
import 'components/Categories.dart';

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
      drawer: const Drawer(),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          const BannerImage(),
          const Categories(),
          Container(

            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenHeight(25)),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(children: [
              const Text("Most Popular",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.start),
              GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: [
                  Stack(
                    children: [
                      Image.network("https://images.squarespace-cdn.com/content/v1/55fc0004e4b069a519961e2d/1442590746571-RPGKIXWGOO671REUNMCB/image-asset.gif",width: getProportionateScreenWidth(150),),
                    ],
                  )
                ],
              ),

            ]),
          ),
        ],
      ),
    );
  }
}
