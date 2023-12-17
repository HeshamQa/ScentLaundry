import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/TextForm.dart';

import 'AddCategories.dart';

class AddSubCategories extends StatefulWidget {
  const AddSubCategories({super.key,});

  @override
  State<AddSubCategories> createState() => _AddSubCategoriesState();
}

class _AddSubCategoriesState extends State<AddSubCategories> {
  @override
  Widget build(BuildContext context) {
    TextEditingController image=TextEditingController(text: 'https://firebasestorage.googleapis.com/v0/b/scentlaundry.appspot.com/o/Tshirt-removebg-preview.png?alt=media&token=f223ae09-6248-49a2-9a6a-9e2e511d48d7');
    TextEditingController name=TextEditingController(text: 'T-Shirt');
    TextEditingController price=TextEditingController(text: '1');

    Future<void> addSubCate() async {
      CollectionReference subCate = FirebaseFirestore.instance.collection('Categories').doc('PtpSKSZCwH93CSWDl72J').collection('SubCate');
      return subCate.add({
        "Image": image.text,
        "Name" : name.text,
        "price" : price.text,
      }).then((value) => print('')).catchError((error) => print("failed to add user: $error"));
    }
    TextEditingController image1=TextEditingController(text: 'https://firebasestorage.googleapis.com/v0/b/scentlaundry.appspot.com/o/dres.png?alt=media&token=0c9155dc-6484-4515-b2fe-ac4c9a18e273');
    TextEditingController name1=TextEditingController(text: 'Dress');
    TextEditingController price1=TextEditingController(text: '2');

    Future<void> addSubCate1() async {
      CollectionReference subCate = FirebaseFirestore.instance.collection('Categories').doc('PtpSKSZCwH93CSWDl72J').collection('SubCate');
      return subCate.add({
        "Image": image1.text,
        "Name" : name1.text,
        "price" : price1.text,
      }).then((value) => print('')).catchError((error) => print("failed to add user: $error"));
    }
    TextEditingController image2=TextEditingController(text: 'https://firebasestorage.googleapis.com/v0/b/scentlaundry.appspot.com/o/soks.png?alt=media&token=5e1adf7c-871d-4a33-b8da-95e61ea85e6b');
    TextEditingController name2=TextEditingController(text: 'Socks');
    TextEditingController price2=TextEditingController(text: '0.5');

    Future<void> addSubCate2() async {
      CollectionReference subCate = FirebaseFirestore.instance.collection('Categories').doc('PtpSKSZCwH93CSWDl72J').collection('SubCate');
      return subCate.add({
        "Image": image2.text,
        "Name" : name2.text,
        "price" : price2.text,
      }).then((value) => print('')).catchError((error) => print("failed to add user: $error"));
    }
    TextEditingController image3=TextEditingController(text: 'https://firebasestorage.googleapis.com/v0/b/scentlaundry.appspot.com/o/pantss.png?alt=media&token=196b729b-33ac-4f00-99e6-ba901d88bbbc');
    TextEditingController name3=TextEditingController(text: 'Pants');
    TextEditingController price3=TextEditingController(text: '1');

    Future<void> addSubCate3() async {
      CollectionReference subCate = FirebaseFirestore.instance.collection('Categories').doc('PtpSKSZCwH93CSWDl72J').collection('SubCate');
      return subCate.add({
        "Image": image3.text,
        "Name" : name3.text,
        "price" : price3.text,
      }).then((value) => print('')).catchError((error) => print("failed to add user: $error"));
    }
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: getProportionateScreenWidth(375),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextForm(textEditingController: image, obscure: false, hint: 'image', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: name, obscure: false, hint: 'name', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: price, obscure: false, hint: 'price', enabled: true),
                  CustomButton(title: "Add",press: (){
                    addSubCate();
                    image.clear();
                    name.clear();
                    price.clear();
                    }),
                  CustomButton(title: "Done",press: (){
                    Get.offAll(const AddCategories());
                  }),
                  TextForm(textEditingController: image1, obscure: false, hint: 'image', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: name1, obscure: false, hint: 'name', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: price1, obscure: false, hint: 'price', enabled: true),
                  CustomButton(title: "Add",press: (){
                    addSubCate1();
                    image1.clear();
                    name1.clear();
                    price1.clear();
                  }),
                  TextForm(textEditingController: image2, obscure: false, hint: 'image', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: name2, obscure: false, hint: 'name', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: price2, obscure: false, hint: 'price', enabled: true),
                  CustomButton(title: "Add",press: (){
                    addSubCate2();
                    image2.clear();
                    name2.clear();
                    price2.clear();
                  }),
                  TextForm(textEditingController: image3, obscure: false, hint: 'image', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: name3, obscure: false, hint: 'name', enabled: true),
                  const SizedBox(height: 10,),
                  TextForm(textEditingController: price3, obscure: false, hint: 'price', enabled: true),
                  CustomButton(title: "Add",press: (){
                    addSubCate3();
                    image3.clear();
                    name3.clear();
                    price3.clear();
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}