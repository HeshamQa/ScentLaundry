import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import 'components/AddToCartButton.dart';
import 'components/Banner.dart';
import 'components/CustomItems.dart';

class CategoryScreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> data;
  final int index;
  const CategoryScreen({super.key, required this.data, required this.index});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<QueryDocumentSnapshot> subCate=[];
  getData() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("Categories").doc(widget.data[widget.index].id).collection('SubCate').get();
    subCate.addAll(querySnapshot.docs);
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
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data[widget.index]['Name']),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          Baner(data: widget.data, index: widget.index,),
          Expanded(
            child: CustomContainer(
                child: Stack(
                  children: [
                    CustomItems(data: subCate,),
                    const AddToCartButton(),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
