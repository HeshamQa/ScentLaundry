import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/admin_providers/admin_order_provider.dart';

class OrderAdminDetails extends StatefulWidget {
  final String id;
  const OrderAdminDetails({super.key,required this.id});

  @override
  State<OrderAdminDetails> createState() => _OrderAdminDetailsState();
}

class _OrderAdminDetailsState extends State<OrderAdminDetails> {
  @override
   initState() {
    getOrderDet();
    super.initState();
  }
  getOrderDet() async {await Provider.of<AdminOrderProvider>(context,listen:false).getOrderDet(widget.id);}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Consumer<AdminOrderProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.orderDet.length,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(value.orderDet[index].item_name),
                  Text(value.orderDet[index].category_name),
                  Text(value.orderDet[index].count.toString()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
