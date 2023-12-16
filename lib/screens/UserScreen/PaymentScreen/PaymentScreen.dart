import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'components/BottomBill.dart';
import 'components/CardPaymentContainer.dart';
import 'components/CashPaymentContainer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
String gVal='card';

class _PaymentScreenState extends State<PaymentScreen> {
  void onRadioValueChanged(String value) {
    setState(() {
      gVal = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Column(
        children: [
          CardPaymentContainer(onRadioValueChanged: onRadioValueChanged),
          CashPaymentContainer(onRadioValueChanged: onRadioValueChanged),
          const Spacer(),
          BottomBill(),
        ],
      ),
    );
  }
}