import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/image_banner.dart';
import '../../../../utils/Static/Size_Config.dart';

class BannerImage extends StatefulWidget {
  const BannerImage({super.key});

  @override
  State<BannerImage> createState() => _BannerImageState();
}

class _BannerImageState extends State<BannerImage> {
  @override
  void initState() {
    Provider.of<ImageBannerProvider>(context, listen: false).getBannerImages();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    PageController pageController=PageController(initialPage: 0,keepPage: false,);
    return SizedBox(
      height: getProportionateScreenHeight(180),
      child: Consumer<ImageBannerProvider>(
        builder: (BuildContext context, ImageBannerProvider value, Widget? child) => PageView.builder(
          itemCount: value.listImageBannerModel.length,
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) =>  Container(
              width: getProportionateScreenWidth(375),
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(15),
                  vertical: getProportionateScreenHeight(25)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(color: Colors.black38,blurRadius: 7,offset: Offset(1, 1))
                ]
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(value.listImageBannerModel[index].image, fit: BoxFit.cover)),
            ),
        ),
      ),
    );
  }
}
