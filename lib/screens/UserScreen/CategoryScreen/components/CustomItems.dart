import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../data/models/cartModel.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Size_Config.dart';
import '../../../../utils/Widget/Custom_Button.dart';

class CustomItems extends StatefulWidget {
  final List<QueryDocumentSnapshot> data;
  final String cateName;
  const CustomItems({
    super.key,
    required this.data, required this.cateName,
  });

  @override
  State<CustomItems> createState() => _CustomItemsState();
}
List<CartModel> cartList=[];
class _CustomItemsState extends State<CustomItems> {
  List<int> list = [];
  CollectionReference Categories =FirebaseFirestore.instance.collection('Cart');
  Future<void> addTOCart(QueryDocumentSnapshot query,int count,String catename) async {
    return Categories.add({
      "Image": query['Image'],
      "Name" : query['Name'],
      "price" : query['price'],
      "count" : count,
      "CateName" : catename,
      "Id" : FirebaseAuth.instance.currentUser!.uid

    }).then((value) => print("user added")).catchError((error) => print("failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: getProportionateScreenHeight(40)),
          child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              list.add(0);
              return Container(
                height: getProportionateScreenHeight(85),
                width: getProportionateScreenWidth(375),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          spreadRadius: 2)
                    ]),
                margin: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenHeight(15)),
                child: Row(
                  children: [
                    Image.network(
                      widget.data[index]['Image'],
                      height: getProportionateScreenHeight(65),
                      width: getProportionateScreenWidth(85),
                      fit: BoxFit.fill,
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      widget.data[index]['Name'],
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Text(
                      '${widget.data[index]['price']}${S.of(context).JOD}',
                      style: const TextStyle(fontSize: 16, fontFamily: 'Inter'),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            if (list[index] > 0) list[index]--;
                          });
                        },
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 25),
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      list[index].toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            list[index]++;
                          });
                        },
                        child: const Text(
                          "+",
                          style: TextStyle(fontSize: 25),
                        )),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(20),
                  horizontal: getProportionateScreenWidth(30)),
              child: CustomButton(press: () {
                for(int i=0;i<list.length;i++){
                  if(list[i]>0){
                    addTOCart(widget.data[i], list[i], widget.cateName);
                    list[i]=0;
                  }
                }
                setState(() {});
              }, title: "Add To Cart"),
            ))
      ],
    );
  }
}
