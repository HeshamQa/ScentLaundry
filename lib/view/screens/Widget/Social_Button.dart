import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Size_Config.dart';

class SocialButton extends StatelessWidget {
  final String image,title;
  const SocialButton({
    super.key, required this.image, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(150),
      child: TextButton(
          onPressed: (){},
          style: const ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(Color(0xffF1F5F9)),
              shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              SvgPicture.asset(image,width: getProportionateScreenWidth(17),height: getProportionateScreenHeight(17),),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(color: Color(0xff475569),fontSize: 15,fontFamily: 'Inter',),
              ),
              const Spacer(),
            ],
          )),
    );
  }
}