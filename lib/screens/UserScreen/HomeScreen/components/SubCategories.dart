import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/subscribe_provider.dart';
import 'package:scentlaundry/screens/UserScreen/HomeScreen/components/SubContainer.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../SubDetails/SubDetails.dart';

class SubCategories extends StatefulWidget {
  const SubCategories({
    super.key,
  });

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  @override
  void initState() {
    Provider.of<SubscribeProvider>(context, listen: false).getSubscription();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      height: getProportionateScreenWidth(200),
      child: Consumer<SubscribeProvider>(
        builder:
            (BuildContext context, SubscribeProvider value, Widget? child) =>
                ListView.builder(
          itemCount: value.listSub.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(SubDetails(subscribeModel: value.listSub[index],));
            },
            child:SubContainer(
            child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    child: Image.asset(
                      'assets/images/sub.png',
                      width: getProportionateScreenWidth(320),
                      height: getProportionateScreenHeight(105),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  SizedBox(
                      width: getProportionateScreenWidth(275),
                      child: Text(
                        "${value.listSub[index].count} ${S.of(context).Items}",
                        style: const TextStyle(fontSize: 22),
                      )),
                  SizedBox(height: getProportionateScreenHeight(5)),
                  SizedBox(
                      width: getProportionateScreenWidth(275),
                      child: Text(
                        "${value.listSub[index].price}${S.of(context).JOD}",
                        style:
                            const TextStyle(fontSize: 20, fontFamily: 'Inter'),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}