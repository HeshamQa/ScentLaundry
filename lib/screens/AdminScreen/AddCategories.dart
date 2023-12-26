// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:scentlaundry/screens/AdminScreen/AddSubCategories.dart';
// import 'package:scentlaundry/utils/Static/Size_Config.dart';
// import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
// import 'package:scentlaundry/utils/Widget/TextForm.dart';
//
// class AddCategories extends StatelessWidget {
//   const AddCategories({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController Image=TextEditingController(text: 'https://firebasestorage.googleapis.com/v0/b/scentlaundry.appspot.com/o/IroningCate.png?alt=media&token=7feb4423-f6f8-4929-9cd0-8b6d4aa4477d');
//     TextEditingController Name=TextEditingController(text: 'Ironing');
//     TextEditingController PopImage=TextEditingController(text: 'https://firebasestorage.googleapis.com/v0/b/scentlaundry.appspot.com/o/ironing.png?alt=media&token=0f485a4c-edf7-4c4f-bfc7-6d5ae31732ac');
//     CollectionReference Categories =FirebaseFirestore.instance.collection('Categories');
//     String ss=Categories.id;
//
//
//     Future<void> addUser() async {
//       return Categories.add({
//         "Image": Image.text,
//         "Name" : Name.text,
//         "PopImage" : PopImage.text,
//       }).then((value) => print("user added")).catchError((error) => print("failed to add user: $error"));
//     }
//     SizeConfig().init(context);
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: getProportionateScreenWidth(375),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               children: [
//                 TextForm(textEditingController: Image, obscure: false, hint: 'Image', enabled: true),
//                 const SizedBox(height: 10,),
//                 const SizedBox(height: 10,),
//                 TextForm(textEditingController: Name, obscure: false, hint: 'Name', enabled: true),
//                 const SizedBox(height: 10,),
//                 TextForm(textEditingController: PopImage, obscure: false, hint: 'PopImage', enabled: true),
//                 CustomButton(title: "Continue",press: (){
//                   addUser();
//                   Get.offAll(const AddSubCategories());
//                 }),
//                 CustomButton(title: "print",press: (){
//                   print(ss);
//                 }),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }