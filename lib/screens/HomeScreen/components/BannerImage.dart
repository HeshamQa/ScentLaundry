import 'package:flutter/material.dart';
import '../../../utils/Static/Size_Config.dart';

class BannerImage extends StatelessWidget {
  const BannerImage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController=PageController(initialPage: 0,keepPage: false,);
    return SizedBox(
      height: getProportionateScreenHeight(180),
      child: PageView.builder(
        itemCount: 3,
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>  Container(
            width: getProportionateScreenWidth(375),
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenHeight(25)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/banner.jpg", fit: BoxFit.cover)),
          ),
      ),
    );
  }
}
