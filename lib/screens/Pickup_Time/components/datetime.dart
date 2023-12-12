import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scentlaundry/controller/timecontroller.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';

class datetime extends StatefulWidget {
  const datetime({super.key});

  @override
  State<datetime> createState() => _datetimeState();
}
late DateTime selectedValue;
TimeController timeController = TimeController();
class _datetimeState extends State<datetime> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DatePicker(
          height: getProportionateScreenHeight(100),
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
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
