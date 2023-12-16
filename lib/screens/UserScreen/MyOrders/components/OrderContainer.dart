import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(color: Colors.black54,offset: Offset(2, 2),blurRadius: 10)
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/delivery.png'),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Items : 20'),
                Text('Status : Deliverd'),
                Text('Date : Nov-12'),
              ],
            )
          ],
        ),
      ),);
  }
}
