import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/cartprovider.dart';
import '../../../../generated/l10n.dart';
import '../../../../utils/Static/Route.dart';
import '../../../../utils/Widget/Custom_Button.dart';
import '../../../../utils/Widget/Custom_Container.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({super.key});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  void initState() {
    // Provider.of<CartProvider>(context,listen: false).getCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).ServicePrice,style: const TextStyle(fontSize: 18,fontFamily: 'Inter'),),
                    Consumer<CartProvider>(
                        builder: (BuildContext context, CartProvider value, Widget? child) =>
                        Text("${value.totalPrice}${S.of(context).JOD}",style: const TextStyle(fontSize: 18,fontFamily: 'Inter'),))
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).DeliveryPrice,style: const TextStyle(fontSize: 18,fontFamily: 'Inter'),),
                    Text("3.00${S.of(context).JOD}",style: const TextStyle(fontSize: 18,fontFamily: 'Inter'),)
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(S.of(context).TotalPrice,style:const TextStyle(fontSize: 22), ),
                    Consumer<CartProvider>(builder: (context, value, child) =>  Text("${value.totalPrice+3.00}${S.of(context).JOD}",style: const TextStyle(fontSize: 22),))
                  ],
                ),
                CustomButton(press: (){
                  Get.toNamed(Approute.PlaceOrder);}, title: "Place Order")
              ],
            ),
          )
      ),
    );
  }
}
