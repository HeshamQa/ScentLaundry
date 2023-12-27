import 'package:flutter/material.dart';
import '../../../../utils/Static/Size_Config.dart';

class Baner extends StatelessWidget {
  final String image;
  const Baner({super.key, required this.image,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(125),
      width: getProportionateScreenWidth(375),
      margin: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(15),
          vertical: getProportionateScreenHeight(25)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black54,blurRadius: 10,offset: Offset(4, 4))
        ],
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Hero(
              tag: image,
              child: Image.network(image, fit: BoxFit.cover))
    ),
    );
  }
}
