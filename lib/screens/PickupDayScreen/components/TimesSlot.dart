import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import '../../../controller/timecontroller.dart';

class Timespicker extends StatefulWidget {
  const Timespicker({Key? key}) : super(key: key);

  @override
  State<Timespicker> createState() => _TimespickerState();
}

class _TimespickerState extends State<Timespicker> {
  var val = 0;
  var val2 = " ";
  TimeController timeController = TimeController();

  @override
  Widget build(BuildContext context) {
    int nowHour = DateTime.now().hour;
    int selectedDay = timeController.selectedValue.value.day;
    int selectedHour = nowHour;

    int time = selectedDay == DateTime.now().day ? selectedHour : 0;

    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(60),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              if (time < 14)
                MaterialButton(
                  color: val == 1 ? Colors.blue : Colors.white,
                  onPressed: () {
                    setState(() {
                      val = 1;
                      val2 = "12:00 pm - 3:00 pm";
                    });
                  },
                  child: const Text("12:00 pm - 3:00 pm", style: TextStyle(color: Colors.black)),
                ),
              if (time < 17)
                MaterialButton(
                  color: val == 2 ? Colors.blue : Colors.white,
                  onPressed: () {
                    setState(() {
                      val = 2; val2 = "3:00 pm - 6:00 pm";
                    });
                  },
                  child: const Text("3:00 pm - 6:00 pm"),
                ),
              if (time < 20)
                MaterialButton(
                  color: val == 3 ? Colors.blue : Colors.white,
                  onPressed: () {
                    setState(() {
                      val = 3; val2 = "6:00 pm - 9:00 pm";
                    });
                  },
                  child: const Text("6:00 pm - 9:00 pm"),
                ),
              if (time < 23)
                MaterialButton(
                  color: val == 4 ? Colors.blue : Colors.white,
                  onPressed: () {
                    setState(() {
                      val = 4;
                      val2 = "9:00 pm - 00:00 pm";
                    });
                  },
                  child: const Text("9:00 pm - 00:00 pm"),
                )
              else
                const Text("The time is not available"),
            ],
          ),
        ),  SizedBox(height: getProportionateScreenHeight(25),),
        RichText(text: TextSpan(children:
        [
           TextSpan(text: "Receipt Day : ",style: TextStyle(fontSize: 25 ,color: StaticColors.black)),
           TextSpan(text:  "${timeController.selectedValue.value.month} - ${timeController.selectedValue.value.day}",style: TextStyle(fontSize: 25,color: StaticColors.blue))
        ])),
        SizedBox(height: getProportionateScreenHeight(15),),
        RichText(text: TextSpan(children:
        [
          TextSpan(text: "Receipt Time : ",style: TextStyle(fontSize: 25 ,color: StaticColors.black)),
          TextSpan(text:  val2,style: TextStyle(fontSize: 25,color: StaticColors.blue))
        ])),
      ],
    );
  }
}
