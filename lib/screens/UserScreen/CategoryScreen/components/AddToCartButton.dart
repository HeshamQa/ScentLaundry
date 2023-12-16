import 'package:flutter/material.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20),horizontal: getProportionateScreenWidth(30)),
          child: CustomButton(press: (){}, title: "Add To Cart"),
        ));
  }
}