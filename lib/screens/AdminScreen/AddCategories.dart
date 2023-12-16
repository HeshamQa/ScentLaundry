import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/TextForm.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController image=TextEditingController();
    TextEditingController name=TextEditingController();
    TextEditingController subImage=TextEditingController();
    TextEditingController subName=TextEditingController();
    TextEditingController price=TextEditingController();
    TextEditingController counter=TextEditingController();
    CollectionReference products =FirebaseFirestore.instance.collection('Categories');

    Future<void> addUser() async {
      return products.add({
        "Image": image.text,
        "Name" : name.text,
        "SubImage" : subImage.text,
        "SubName" : subName.text,
        "price" : price.text,
        "counter" : counter.text,
      }).then((value) => print("user added")).catchError((error) => print("failed to add user: $error"));
    }
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: getProportionateScreenWidth(375),
          child: Column(
            children: [
              TextForm(textEditingController: image, obscure: false, hint: 'image', enabled: true),
              const SizedBox(height: 10,),
              TextForm(textEditingController: name, obscure: false, hint: 'name', enabled: true),
              const SizedBox(height: 10,),
              TextForm(textEditingController: subImage, obscure: false, hint: 'subImage', enabled: true),
              const SizedBox(height: 10,),
              TextForm(textEditingController: subName, obscure: false, hint: 'subName', enabled: true),
              const SizedBox(height: 10,),
              TextForm(textEditingController: price, obscure: false, hint: 'price', enabled: true),
              const SizedBox(height: 10,),
              TextForm(textEditingController: counter, obscure: false, hint: 'counter', enabled: true),
              CustomButton(title: "Add",press: (){
                addUser();
                image.clear();
                name.clear();
                subImage.clear();
                subName.clear();
                price.clear();
                counter.clear();
              })
            ],
          ),
        ),
      ),
    );
  }
}