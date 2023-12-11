import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:scentlaundry/controller/timecontroller.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';

class datetime2 extends StatefulWidget {
  const datetime2({super.key});

  @override
  State<datetime2> createState() => _datetimeState();
}
late DateTime selectedValue;
TimeController timeController = TimeController();
class _datetimeState extends State<datetime2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DatePicker(
          height: getProportionateScreenHeight(100),
          DateTime.now().add(Duration(days: 1)),
          initialSelectedDate: DateTime.now().add(Duration(days: 1)),
          selectionColor: StaticColors.blue,
          selectedTextColor: Colors.white,
          onDateChange: (date) {
            setState(() {
              selectedValue = date;
              print(selectedValue.day);
              DateTime currentDate = DateTime.now();
              timeController.updateSelectedValue(currentDate);
            });
          },
        ),
      ],
    );
  }
}
