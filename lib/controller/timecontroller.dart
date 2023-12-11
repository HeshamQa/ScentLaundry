import 'package:get/get.dart';

class TimeController extends GetxController {
  Rx<DateTime> selectedValue = DateTime.now().obs;

  void updateSelectedValue(DateTime date) {
    selectedValue.value = date;
    print(selectedValue.value.day);
  }
}
