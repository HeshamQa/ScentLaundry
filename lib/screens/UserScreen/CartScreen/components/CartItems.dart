import 'package:flutter/material.dart';
import '../../../../utils/Static/Size_Config.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}
List<int> counter =[];
class _CartItemsState extends State<CartItems> {

  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: cartView.length,
      itemBuilder: (context, index) {
        // counter.add(cartView[index]['count']);
        return Container(
        height: getProportionateScreenHeight(85),
        width: getProportionateScreenWidth(375),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black54, blurRadius: 10, spreadRadius: 2)
            ]),
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(12),
            vertical: getProportionateScreenHeight(10)),
        child: Row(
          children: [
            Image.network(
              '',
              // cartView[index]['Image'],
              height: getProportionateScreenHeight(65),
              width: getProportionateScreenWidth(85),
              fit: BoxFit.fill,
            ),
            const Spacer(
              flex: 1,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "cartView[index]['Name']",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "cartView[index]['CateName']",
                  style: TextStyle(fontSize: 17, fontFamily: 'reg'),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            const Text(
              "cartView[index]['price']",
              style: TextStyle(fontSize: 16, fontFamily: 'reg'),
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
                onTap: () {},
                child: const Text(
                  "-",
                  style: TextStyle(fontSize: 25),
                )),
            const Spacer(
              flex: 1,
            ),
            Text(
              counter[index].toString(),
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(
              flex: 1,
            ),
            InkWell(
                onTap: () {},
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
    );
  }
}
