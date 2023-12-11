import 'package:flutter/material.dart';
import 'package:scentlaundry/data/remote/PopularList.dart';

import '../../../utils/Static/Size_Config.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: getProportionateScreenWidth(25)),
      child: GridView.builder(
          itemCount: popularList.length,
          itemBuilder: (context, index) => InkWell(
            onTap: (){},
            child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 4))
                      ]),
                      child: Image.asset(
                        popularList[index].image,
                        width: getProportionateScreenWidth(150),
                        height: getProportionateScreenHeight(150),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(150),
                      height: getProportionateScreenHeight(150),
                      alignment: Alignment.center,
                      color: Colors.black45,
                      child: Text(
                        popularList[index].name,
                        style: const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ],
                ),
          ),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2)),
    );
  }
}
