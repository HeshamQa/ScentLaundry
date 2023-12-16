import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final String cardNumber;
  final Color color;
  final String cardHolder;
  final String cardExpiration;

const card({super.key,
    required this.color,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 200,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "assets/images/contact_less.png",
                  height: 20,
                  width: 18,
                ),
                Image.asset(
                  "assets/images/mastercard.png",
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                cardNumber,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 21,
                    fontFamily: 'CourrierPrime'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'CARDHOLDER',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cardHolder,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'VALID THRU',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      cardExpiration,
                      style: const TextStyle(
                          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
