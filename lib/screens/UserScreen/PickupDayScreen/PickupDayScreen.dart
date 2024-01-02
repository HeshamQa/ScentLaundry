import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/controller/time_controller.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

import '../../../generated/l10n.dart';

class PickupDayScreen extends StatefulWidget {
  const PickupDayScreen({super.key});

  @override
  State<PickupDayScreen> createState() => _PickupDayScreenState();
}

class _PickupDayScreenState extends State<PickupDayScreen> {
  var val = 0;
  var val2 = " ";
  DateTime selectedValue = DateTime(0);
  TimeController controller = Get.put(TimeController());
  bool isToday = true;
  int check = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.primaryColor,
      appBar: AppBar(
        title: Text(S.of(context).PickUpDate),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: CustomContainer(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(S.of(context).ChoosePickUpDay,
                    style: const TextStyle(fontSize: 30)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DatePicker(
                      height: getProportionateScreenHeight(100),
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: StaticColors.blue,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        setState(() {
                          selectedValue = date;
                          date.month == DateTime.now().month
                              ? date.day == DateTime.now().day
                                  ? isToday = true
                                  : isToday = false
                              : isToday = false;
                          isToday ? check = 14 : 0;
                        });
                      },
                    ),
                  ],
                ),
                Text(S.of(context).ChoosePickUpTime,
                    style: const TextStyle(fontSize: 30)),
                Column(children: [
                  SizedBox(
                    height: getProportionateScreenHeight(60),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        if (DateTime.now().hour < check)
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
                        if (DateTime.now().hour < check + 3)
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
                        if (DateTime.now().hour < check + 6)
                          MaterialButton(
                            color: val == 3 ? Colors.blue : Colors.white,
                            onPressed: () {
                              setState(() {
                                val = 3;
                                val2 = "6:00 pm - 9:00 pm";
                              });
                            },
                            child: const Text("6:00 pm - 9:00 pm"),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  Row(children: [
                    Text(S.of(context).PickUpDay,
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.black)),
                    Text("${selectedValue.month} - ${selectedValue.day}",
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.blue))
                  ]),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Row(children: [
                    Text(S.of(context).PickUpTime,
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.black)),
                    Text(val2,
                        style:
                            TextStyle(fontSize: 25, color: StaticColors.blue))
                  ]),
                ]),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomButton(
                      title: S.of(context).Next,
                      press: () {
                        controller.updatePickUpDate(selectedValue, val2);
                        Get.toNamed(Approute.ReceiptTime);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
