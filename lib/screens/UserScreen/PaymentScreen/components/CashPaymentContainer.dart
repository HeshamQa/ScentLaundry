import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';
import '../PaymentScreen.dart';

class CashPaymentContainer extends StatefulWidget {
  final void Function(String) onRadioValueChanged;

  const CashPaymentContainer({super.key, required this.onRadioValueChanged});

  @override
  State<CashPaymentContainer> createState() => _CashPaymentContainerState();
}

class _CashPaymentContainerState extends State<CashPaymentContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(15),
        bottom: getProportionateScreenHeight(75),
      ),
      width: getProportionateScreenWidth(325),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 2,
            offset: Offset(2, 2),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/cash.png'),
          const Text(
            'Pay on Cash Or Subscriptions',
            style: TextStyle(fontSize: 17),
          ),
          const Spacer(),
          Radio(
              value: 'cash',
              groupValue: gVal,
              onChanged: (value) {
                widget.onRadioValueChanged(value!);
              }),
        ],
      ),
    );
  }
}
