import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/admin_providers/admin_sub_provider.dart';

import '../../utils/Static/Size_Config.dart';

class SubCount extends StatefulWidget {
  const SubCount({super.key});

  @override
  State<SubCount> createState() => _SubCountState();
}

class _SubCountState extends State<SubCount> {
  @override
  void initState() {
    Provider.of<AdminSubProvider>(context, listen: false).getAllSub();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<AdminSubProvider>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.subModel.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                TextEditingController textEditingController =
                TextEditingController();
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SizedBox(
                      height: getProportionateScreenHeight(350),
                      width: getProportionateScreenWidth(375),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: textEditingController,
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              decoration: const InputDecoration(
                                errorMaxLines: 1,
                                hintStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      Provider.of<AdminSubProvider>(context,
                                              listen: false)
                                          .updateCount(value.subModel[index].id,
                                              textEditingController.text);
                                      Get.back();
                                      Get.back();
                                      Get.to(const SubCount());
                                    },
                                    child: const Text("Save")),
                                ElevatedButton(
                                    onPressed: () {
                                      Provider.of<AdminSubProvider>(context,
                                              listen: false)
                                          .deleteMySub(
                                              value.subModel[index].id);
                                      Get.back();
                                      Get.back();
                                      Get.to(const SubCount());
                                    },
                                    child: const Text("Delete")),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                width: getProportionateScreenWidth(375),
                height: getProportionateScreenHeight(75),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 2)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(value.subModel[index].name),
                    Text(value.subModel[index].price),
                    Text(value.subModel[index].count),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
