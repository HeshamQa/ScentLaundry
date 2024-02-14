import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/admin_providers/admin_order_provider.dart';
import 'package:scentlaundry/screens/AdminScreen/order_details.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  void initState() {
    Provider.of<AdminOrderProvider>(context, listen: false).getAllOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Consumer<AdminOrderProvider>(
        builder: (context, value, child) => ListView.builder(
          reverse: true,
          itemCount: value.order.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Get.to(OrderAdminDetails(
                id: value.order[index].id,
              ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(value.order[index].name),
                      Column(
                        children: [
                          Text(value.order[index].pdate),
                          Text(value.order[index].rdate),
                        ],
                      ),
                      Text(value.order[index].totalprice),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _launchMaps(value.order[index].location);
                          }, child: const Text("Google Map")),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (value.order[index].status == "Accepted") {
                            Provider.of<AdminOrderProvider>(context,
                                    listen: false)
                                .updateOrderStatus(value.order[index].id, 2);
                            Get.back();
                            Get.to(const OrdersScreen());
                          } else if (value.order[index].status == "Picked Up") {
                            Provider.of<AdminOrderProvider>(context,
                                    listen: false)
                                .updateOrderStatus(value.order[index].id, 3);
                            Get.back();
                            Get.to(const OrdersScreen());
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: value.order[index].status ==
                                    "Accepted"
                                ? const MaterialStatePropertyAll(Colors.white)
                                : value.order[index].status == "Picked Up"
                                    ? const MaterialStatePropertyAll(Colors.red)
                                    : const MaterialStatePropertyAll(
                                        Colors.green)),
                        child: Text(value.order[index].status),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  _launchMaps(String latlng) async {
    String mapsUrl = "https://www.google.com/maps/search/?api=1&query=$latlng";
    if (await canLaunchUrlString(mapsUrl)) {
      await launchUrlString(mapsUrl);
    } else {
      throw 'Could not launch $mapsUrl';
    }
  }

}
