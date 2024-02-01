import 'package:flutter/material.dart';

import '../../../../utils/Static/Size_Config.dart';
import '../PaymentScreen.dart';
import 'CardDetails.dart';

class CardPaymentContainer extends StatefulWidget {
  final void Function(String) onRadioValueChanged;

  const CardPaymentContainer({super.key, required this.onRadioValueChanged});

  @override
  State<CardPaymentContainer> createState() => _CardPaymentContainerState();
}

class _CardPaymentContainerState extends State<CardPaymentContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
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
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/payment.png'),
              const Text('Dept / credit card', style: TextStyle(fontSize: 18)),
              const Spacer(),
              Radio(
                value: 'card',
                groupValue: gVal,
                onChanged: (value) {
                  showDialog(
                    context: context,
                    builder: (context) => const AlertDialog(
                        title: Text('Coming Soon...'),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  );
                  // widget.onRadioValueChanged(value!);
                },
              ),
            ],
          ),
          if (gVal == 'card') const CardDetails()
        ],
      ),
    );
  }
}
