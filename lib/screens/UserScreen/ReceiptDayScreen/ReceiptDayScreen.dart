import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:scentlaundry/screens/UserScreen/PaymentScreen/PaymentScreen.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Button.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';

class ReceiptDayScreen extends StatefulWidget {
  final DateTime initialDate;
  final String time;
  const ReceiptDayScreen({Key? key, required this.initialDate, required this.time}) : super(key: key);

  @override
  State<ReceiptDayScreen> createState() => _ReceiptDayScreenState();
}

class _ReceiptDayScreenState extends State<ReceiptDayScreen> {
  late DateTime _selectedDate;
  String _selectedTimeSlot = '12:00-3:00'; // Default time slot
  final List<String> _timeSlots = ['12:00-3:00', '3:00-6:00', '6:00-9:00'];

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate.add(const Duration(days: 1)); // Start from the next day
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a receipt time'),
        backgroundColor: StaticColors.primaryColor,
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
                      title: const Text('Choose receipt Day', style: TextStyle(fontSize: 20)),
                      trailing: Text(DateFormat('EEEE, dd MMM').format(_selectedDate), style: const TextStyle(fontSize: 17)),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(375),
                      height: getProportionateScreenHeight(125),
                      child: DatePicker(
                        widget.initialDate.add(const Duration(days: 1)),
                        initialSelectedDate: widget.initialDate.add(const Duration(days: 1)),
                        selectionColor: StaticColors.primaryColor,
                        selectedTextColor: Colors.black,
                        onDateChange: (date) {
                          setState(() {
                            _selectedDate = date;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(25)),
                    ListTile(
                      title: const Text('Choose receipt Time', style: TextStyle(fontSize: 20)),
                      trailing: Text(_selectedTimeSlot, style: const TextStyle(fontSize: 17)),
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
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25), vertical: getProportionateScreenHeight(25)),
                child: CustomButton(
                  press: () {
                   Get.to(PaymentScreen(pDate: widget.initialDate, rDate: _selectedDate, ptime: widget.time, rtime: _selectedTimeSlot,));
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
