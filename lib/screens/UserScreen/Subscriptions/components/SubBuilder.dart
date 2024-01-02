import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/sub_controller.dart';

import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';

class SubBuilder extends StatefulWidget {
  const SubBuilder({super.key});

  @override
  State<SubBuilder> createState() => _SubBuilderState();
}

class _SubBuilderState extends State<SubBuilder> {
  @override
  void initState() {
    Provider.of<SubController>(context,listen: false).getMySub();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SubController>(
      builder: (BuildContext context, SubController value, Widget? child) => ListView.builder(
        itemCount: value.mySub.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.black54,blurRadius: 10,offset: Offset(2, 2),spreadRadius: 2),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("${S.of(context).Items}: ${value.mySub[index].c}/${value.mySub[index].count}",style: const TextStyle(fontSize: 20)),
                  const Spacer(),
                  Text('${value.mySub[index].price}${S.of(context).JOD}',style: const TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10)),
              Text(S.of(context).TShirtPantsShort,style: const TextStyle(fontSize: 17,fontFamily: 'reg'))
            ],
          ),
        ),
      ),
    );
  }
}
