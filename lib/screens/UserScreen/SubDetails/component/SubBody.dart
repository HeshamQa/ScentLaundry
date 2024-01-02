import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/sub_controller.dart';
import 'package:scentlaundry/models/SubscribeModel.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';
import '../../../../utils/Widget/Custom_Container.dart';

class SubBody extends StatelessWidget {
  final SubscribeModel subscribeModel;
  const SubBody({super.key, required this.subscribeModel});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(25),vertical: getProportionateScreenHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${subscribeModel.count} ${S.of(context).Items} - ${subscribeModel.price}${S.of(context).JOD}",
              style: const TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text("${S.of(context).Thesubscription} ${subscribeModel.count} ${S.of(context).piecesof} ${subscribeModel.price}${S.of(context).JOD}.",
              style: const TextStyle(fontSize: 19, fontFamily: 'reg'),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text(
              S.of(context).Ifyouwantto,
              style: const TextStyle(fontSize: 20, fontFamily: 'inter'),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10.0)),
              child: CustomButton(press: () {
                Provider.of<SubController>(context,listen: false).addSub(idsub: subscribeModel.id,count: subscribeModel.count);
              }, title: S.of(context).Subscribe),
            ),
          ],
        ),
      ),
    );
  }
}