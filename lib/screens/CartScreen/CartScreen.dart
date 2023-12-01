import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import '../../utils/Static/StaticColors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}
int counter=0;
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(550),
            child: ListView.builder(
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
                      print(counter);
                      },child: const Text("+",style: TextStyle(fontSize: 25),)),
                    const Spacer(flex: 1,),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: CustomContainer(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Service Price",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),),
                      Text("8.50 JOD",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),)
                    ],
                  ),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery Price",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),),
                    Text("3.00 JOD",style: TextStyle(fontSize: 18,fontFamily: 'Inter'),)
                  ],
                ),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Price",style: TextStyle(fontSize: 22), ),
                    Text("11.50 JOD",style: TextStyle(fontSize: 22),)
                  ],
                ),
                CustomButton(press: (){}, title: "Place Order")
              ],
            ),
                )
            ),
          )
        ],
      ),
    );
  }
}
