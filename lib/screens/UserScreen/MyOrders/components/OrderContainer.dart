import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/order_provider.dart';

class Orders extends StatefulWidget {
  const Orders({
    super.key,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  void initState() {
    Provider.of<OrderProvider>(context,listen: false).getOrder();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (BuildContext context, OrderProvider value, Widget? child) => ListView.builder(
        itemCount: value.orderList.length,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  value.orderList[index].idorderstate=="1"?
                  const Text('Status : Delivered'):const Text("Status : Working..."),
                  Text('Date : ${value.orderList[index].orderdate}'),
                ],
              )
            ],
          ),
        ),),
    );
  }
}
