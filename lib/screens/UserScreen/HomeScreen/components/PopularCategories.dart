import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/locale_config.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../CategoryScreen/CategoryScreen.dart';

class PopularCategories extends StatefulWidget {
  const PopularCategories({
    super.key,
  });

  @override
  State<PopularCategories> createState() => _PopularCategoriesState();
}

List<QueryDocumentSnapshot> pop = [];

class _PopularCategoriesState extends State<PopularCategories> {
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Categories")
        .where("popular", isEqualTo: true)
        .get();
    pop.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: LocaleConfig().isAr?EdgeInsets.only(left: getProportionateScreenWidth(25)):EdgeInsets.only(right: getProportionateScreenWidth(25)),
      child: GridView.builder(
          itemCount: pop.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(CategoryScreen(
                  data: pop,
                  index: index,
                ));
              },
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
                    child: Hero(
                      tag: pop[index].id,
                      child: Image.network(
                        pop[index]['PopImage'],
                        width: getProportionateScreenWidth(150),
                        height: getProportionateScreenHeight(150),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: getProportionateScreenWidth(150),
                    height: getProportionateScreenHeight(150),
                    alignment: Alignment.center,
                    color: Colors.black45,
                    child: Text(
                      LocaleConfig.getCategoryAtIndex(pop[index]['Name'],context),
                      style: const TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
            );
          },
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2)),
    );
  }
}
