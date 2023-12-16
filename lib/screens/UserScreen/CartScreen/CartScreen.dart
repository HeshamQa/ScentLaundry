import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import '../../../utils/Static/StaticColors.dart';
import 'components/CartItems.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

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
            child: const CartItems(),
          ),

        ],
      ),
    );
  }
}
