import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';
import '../../../../utils/Widget/Custom_Container.dart';

class SubBody extends StatelessWidget {
  final QueryDocumentSnapshot subscribeModel;
  const SubBody({
    super.key,required this.subscribeModel,
  });

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
              "${subscribeModel['Item']} ${S.of(context).Items} - ${subscribeModel['Price']}${S.of(context).JOD}",
              style: const TextStyle(fontSize: 27),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Text("${S.of(context).Thesubscription} ${subscribeModel['Item']} ${S.of(context).piecesof} ${subscribeModel['Price']} ${S.of(context).JOD}.",
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
              child: CustomButton(press: () {}, title: S.of(context).Subscribe),
            ),
          ],
        ),
      ),
    );
  }
}