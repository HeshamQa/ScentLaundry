import 'package:get/get.dart';

class TimeController extends GetxController {
  Rx<DateTime> day = DateTime(0).obs;
  RxString time = ''.obs;
  Rx<DateTime> day1 = DateTime(0).obs;
  RxString time1 = ''.obs;
  void updatePickUpDate(DateTime selectedDay,String selectedTime) {
    day.value = selectedDay;
    time.value = selectedTime;
  }
  void updateReceiptDate(DateTime selectedDay,String selectedTime) {
    day1.value = selectedDay;
    time1.value = selectedTime;
  }
}
