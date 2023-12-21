import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../utils/Static/Size_Config.dart';

class CartItems extends StatefulWidget {
  const CartItems({super.key});

  @override
  State<CartItems> createState() => _CartItemsState();
}
List<int> counter =[];
class _CartItemsState extends State<CartItems> {
  List<QueryDocumentSnapshot> cartView = [];
  var collection = FirebaseFirestore.instance.collection('Cart');
  getDataFromCart() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Cart")
        .where('Id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    cartView.addAll(querySnapshot.docs);
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    getDataFromCart();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartView.length,
      itemBuilder: (context, index) {
        counter.add(cartView[index]['count']);
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
              cartView[index]['Image'],
              height: getProportionateScreenHeight(65),
              width: getProportionateScreenWidth(85),
              fit: BoxFit.fill,
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  cartView[index]['Name'],
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  cartView[index]['CateName'],
                  style: const TextStyle(fontSize: 17, fontFamily: 'reg'),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              cartView[index]['price'],
              style: const TextStyle(fontSize: 16, fontFamily: 'reg'),
            ),
            const Spacer(
              flex: 2,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    if(counter[index] == 1) {
                      FirebaseFirestore.instance.collection('Cart').doc(
                          cartView[index].id).delete();
                      cartView.removeAt(index);
                      counter.clear();
                    }
                    else {
                      counter[index]--;
                    }
                        // : collection
                        // .doc(cartView[index].id)
                        // .update({'count' : count}) // <-- Updated data
                        // .then((_) => print('Success'))
                        // .catchError((error) => print('Failed: $error'));
                    // print("$count ${cartView[index]['count']} ${cartView[index].id}");
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
              counter[index].toString(),
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(
              flex: 1,
            ),
            InkWell(
                onTap: () {
                  setState(() {
                    counter[index]++;
                    // FirebaseFirestore.instance
                    //     .collection('Cart')
                    //     .doc(cartView[index].id)
                    //     .update({'count': count});
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
    );
  }
}
