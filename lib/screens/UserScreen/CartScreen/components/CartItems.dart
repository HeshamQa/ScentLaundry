import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => Container(
        height: getProportionateScreenHeight(85),
        width: getProportionateScreenWidth(375),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black54,blurRadius: 10,spreadRadius: 2)
            ]
        ),
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(12),
            vertical: getProportionateScreenHeight(10)),
        child: Row(
          children: [
            Image.asset(
              "assets/images/banner.jpg",
              height: getProportionateScreenHeight(65),
              width: getProportionateScreenWidth(85),
              fit: BoxFit.fill,
            ),
            const Spacer(flex: 1,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("T-Shirt",style: TextStyle(fontSize: 20),),
                Text("Drying",style: TextStyle(fontSize: 17,fontFamily: 'reg'),),
              ],
            ),
            const Spacer(flex: 2,),
            const Text("1.75JOD",style: TextStyle(fontSize: 16,fontFamily: 'reg'),),
            const Spacer(flex: 2,),
            InkWell(onTap:(){
              setState(() {counter!=0?counter--:counter;});
            },child: const Text("-",style: TextStyle(fontSize: 25),)),
            const Spacer(flex: 1,),
            Text("$counter",style: const TextStyle(fontSize:20),),
            const Spacer(flex: 1,),
            InkWell(onTap:(){
              setState(() {counter++;}
              );
            },child: const Text("+",style: TextStyle(fontSize: 25),)),
            const Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}
