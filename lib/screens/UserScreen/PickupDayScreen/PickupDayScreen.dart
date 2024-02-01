import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:scentlaundry/screens/UserScreen/ReceiptDayScreen/ReceiptDayScreen.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

class PickupDayScreen extends StatefulWidget {
  const PickupDayScreen({Key? key}) : super(key: key);

  @override
  State<PickupDayScreen> createState() => _PickupDayScreenState();
}

class _PickupDayScreenState extends State<PickupDayScreen> {
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String _selectedTimeSlot = '12:00-3:00'; // Default time slot

  // Assuming these time slots are fixed, they can be defined as a list of strings
  final List<String> _timeSlots = ['12:00-3:00', '3:00-6:00', '6:00-9:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a pickup time'),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(75)),
        child: CustomContainer(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text(
                        'Choose Pick Up Day',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Text(
                        DateFormat('EEEE, dd MMM').format(_selectedDate),
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(375),
                      height: getProportionateScreenHeight(125),
                      child: DatePicker(
                        DateTime.now().add(const Duration(days: 1)),
                        selectedTextColor: Colors.black,
                        selectionColor: StaticColors.primaryColor,
                        initialSelectedDate:
                            DateTime.now().add(const Duration(days: 1)),
                        onDateChange: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    ListTile(
                      title: const Text(
                        'Choose Pick Up Time',
                        style: TextStyle(fontSize: 20),
                      ),
                      trailing: Text(_selectedTimeSlot,
                          style: const TextStyle(fontSize: 17)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Wrap(
                        spacing: 8.0,
                        children: _timeSlots.map((timeSlot) {
                          return ChoiceChip(
                            label: Text(timeSlot),
                            selected: _selectedTimeSlot == timeSlot,
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedTimeSlot = timeSlot;
                                });
                              }
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(25),
                    vertical: getProportionateScreenHeight(25)),
                child: CustomButton(
                  press: () {
                    Get.to(ReceiptDayScreen(initialDate: _selectedDate, time: _selectedTimeSlot,));
                  },
                  title: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
