import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/cartprovider.dart';
import '../../../../utils/Static/Size_Config.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}
class _CartItemsState extends State<CartItems> {
  @override
  initState() {
    Provider.of<CartProvider>(context, listen: false).getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(525),
      child: Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider value, Widget? child) =>
            ListView.builder(
          itemCount: value.listCart.length,
          itemBuilder: (context, index) {
            return Container(
              height: getProportionateScreenHeight(85),
              width: getProportionateScreenWidth(375),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54, blurRadius: 10, spreadRadius: 2)
                  ]),
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(12),
                  vertical: getProportionateScreenHeight(10)),
              child: Row(
                children: [
                  Image.network(value.listCart[index].image,
                    height: getProportionateScreenHeight(65),
                    width: getProportionateScreenWidth(85),
                    fit: BoxFit.cover,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        value.listCart[index].name,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        value.listCart[index].cate,
                        style: const TextStyle(fontSize: 17, fontFamily: 'reg'),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    value.listCart[index].price,
                    style: const TextStyle(fontSize: 16, fontFamily: 'reg'),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  InkWell(
                      onTap: () {
                        var newCount =
                            value.listCart[index].count - 1;
                        value.updateItemCount(
                            value.listCart[index].id,
                            newCount,
                            index);
                      },
                      child: const Text(
                        "-",
                        style: TextStyle(fontSize: 25),
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    value.listCart[index].count.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                      onTap: () {
                        var newCount =
                            value.listCart[index].count + 1;
                        value.updateItemCount(
                            value.listCart[index].id,
                            newCount,
                            index);
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
    );
  }
}
