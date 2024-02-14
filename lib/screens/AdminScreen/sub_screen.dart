import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/admin_providers/admin_sub_provider.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';

class SubAdminScreen extends StatefulWidget {
  const SubAdminScreen({super.key});

  @override
  State<SubAdminScreen> createState() => _SubAdminScreenState();
}

class _SubAdminScreenState extends State<SubAdminScreen> {
  @override
  void initState() {
    Provider.of<AdminSubProvider>(context,listen: false).getSubModel();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: getProportionateScreenHeight(750),
        child: Consumer<AdminSubProvider>(
          builder: (context, value, child) => ListView.builder(
            itemCount: value.subModel2.length,
            itemBuilder: (context, index) => Container(
              width: getProportionateScreenWidth(375),
              height: getProportionateScreenHeight(75),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black,width: 2)
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(value.subModel2[index].name),
                    Text(value.subModel2[index].price),
                    ElevatedButton(onPressed: (){
                      Provider.of<AdminSubProvider>(context,listen: false).acceptMySub(value.subModel2[index].id);
                      Get.back();
                      Get.to(const SubAdminScreen());
                    },style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.greenAccent)), child: const Text("Accept"),),
                    ElevatedButton(onPressed: (){
                      Provider.of<AdminSubProvider>(context,listen: false).deleteMySub(value.subModel2[index].id);
                      Get.back();
                      Get.to(const SubAdminScreen());
                    },style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red)), child: const Text("Cancel"),)
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}
