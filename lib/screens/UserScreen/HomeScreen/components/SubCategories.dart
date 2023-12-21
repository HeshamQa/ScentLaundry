import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  List<QueryDocumentSnapshot> sub=[];
  getData() async {
    QuerySnapshot query = await FirebaseFirestore.instance.collection("Sub").get();
    sub.addAll(query.docs);
    setState((){});
  }
  @override
  initState() {
    super.initState();
    getData();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(200),
      child: ListView.builder(
        itemCount: sub.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Get.to(SubDetails(subscribeModel: sub[index]));
          },
          child: Container(
            width: getProportionateScreenWidth(320),
            height: getProportionateScreenHeight(150),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 15, offset: Offset(4, 4))
                ]),
            margin: EdgeInsets.only(
                left: getProportionateScreenWidth(20),
                right: getProportionateScreenWidth(20),
                bottom: getProportionateScreenHeight(20)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  child: Hero(
                    tag: sub[index]['Item'],
                    child: Image.asset(
                      'assets/images/sub.png',
                      width: getProportionateScreenWidth(320),
                      height: getProportionateScreenHeight(105),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
                SizedBox(
                    width: getProportionateScreenWidth(275),
                    child: Text(
                      '${sub[index]['Item']} ${S.of(context).Items}',
                      style: const TextStyle(fontSize: 22),
                    )),
                SizedBox(height: getProportionateScreenHeight(5)),
                SizedBox(
                    width: getProportionateScreenWidth(275),
                    child: Text(
                      "${sub[index]['Price']}${S.of(context).JOD}",
                      style: const TextStyle(fontSize: 20, fontFamily: 'Inter'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
