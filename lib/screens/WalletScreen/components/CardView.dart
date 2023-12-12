import 'package:flutter/material.dart';

import 'Card.dart';

class CardView extends StatelessWidget {
  const CardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) =>
        const card(
            color: Color(0xFF090943),
            cardExpiration: "05/2024",
            cardHolder: "HESHAM QA",
            cardNumber: "XXXX XXXX XXXX 4567"),
      ),
    );
  }
}