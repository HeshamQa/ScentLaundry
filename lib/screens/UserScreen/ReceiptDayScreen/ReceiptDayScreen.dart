import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import '../../../controller/time_controller.dart';
import '../../../generated/l10n.dart';

class ReceiptTime extends StatefulWidget {
  const ReceiptTime({super.key});

  @override
  State<ReceiptTime> createState() => _ReceiptTimeState();
}

class _ReceiptTimeState extends State<ReceiptTime> {
  var val = 0;
  var val2 = "";
  TimeController controller = Get.put(TimeController());
  late DateTime selectedValue;
  late DateTime initialValue;

  @override
  void initState() {
    getCurrent();
    super.initState();
  }

  getCurrent() {
    selectedValue = controller.day.value;
    initialValue = controller.day.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.primaryColor,
      appBar: AppBar(
        title: const Text("Receipt time"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CustomContainer(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Choose Receipt Day", style: TextStyle(fontSize: 30)),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DatePicker(
                    height: getProportionateScreenHeight(100),
                    initialValue.add(const Duration(days: 1)),
                    initialSelectedDate:
                        initialValue.add(const Duration(days: 1)),
                    selectionColor: StaticColors.blue,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      setState(() {
                        selectedValue = date;
                      });
                    },
                  ),
                ],
              ),
              const Text("Choose Receipt Time", style: TextStyle(fontSize: 30)),
              Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        MaterialButton(
                          color: val == 1 ? Colors.blue : Colors.white,
                          onPressed: () {
                            setState(() {
                              val = 1;
                              val2 = "12:00 pm - 3:00 pm";
                            });
                          },
                          child: const Text("12:00 pm - 3:00 pm",
                              style: TextStyle(color: Colors.black)),
                        ),
                        MaterialButton(
                          color: val == 2 ? Colors.blue : Colors.white,
                          onPressed: () {
                            setState(() {
                              val = 2;
                              val2 = "3:00 pm - 6:00 pm";
                            });
                          },
                          child: const Text("3:00 pm - 6:00 pm"),
                        ),
                        MaterialButton(
                          color: val == 3 ? Colors.blue : Colors.white,
                          onPressed: () {
                            setState(() {
                              val = 3;
                              val2 = "6:00 pm - 9:00 pm";
                            });
                          },
                          child: const Text("6:00 pm - 9:00 pm"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Receipt Day : ",
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.black)),
                    TextSpan(
                        text: "${selectedValue.month} - ${selectedValue.day}",
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.blue))
                  ])),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Receipt Time : ",
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.black)),
                    TextSpan(
                        text: val2,
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.blue))
                  ])),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                    press: () {
                      controller.updateReceiptDate(selectedValue, val2);
                      Get.toNamed(Approute.PaymentScreen);
                    },
                    title: S.of(context).Next),
              )
            ],
          ),
        )),
      ),
    );
  }
}
