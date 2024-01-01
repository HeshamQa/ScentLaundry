import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/controller/timecontroller.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';

class DatesTime extends StatefulWidget {
  const DatesTime({super.key});

  @override
  State<DatesTime> createState() => _datetimeState();
}
late DateTime selectedValue;
TimeController timeController = TimeController();
class _datetimeState extends State<DatesTime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DatePicker(
          height: getProportionateScreenHeight(100),
          DateTime.now().add(const Duration(days: 1)),
          initialSelectedDate: DateTime.now().add(const Duration(days: 1)),
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
