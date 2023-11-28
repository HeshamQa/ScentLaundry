import 'package:flutter/material.dart';
import '../../../utils/Static/Size_Config.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(110),
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: 15,
        ),
        itemCount: 7,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Image.network(
                "https://images.squarespace-cdn.com/content/v1/55fc0004e4b069a519961e2d/1442590746571-RPGKIXWGOO671REUNMCB/image-asset.gif",
                width: getProportionateScreenWidth(50),
                height: getProportionateScreenHeight(50),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: SizedBox(
                    width: getProportionateScreenWidth(60),
                    child: const Text(
                      "Categories Name",
                      maxLines: 2,
                      // categoriesModelList[index].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black,fontFamily: 'Inter',fontSize: 13),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
