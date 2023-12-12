import 'package:flutter/material.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Widget/Custom_Container.dart';
import 'package:contactus/contactus.dart';

class Contact_Us extends StatelessWidget {
  const Contact_Us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      backgroundColor: StaticColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenHeight(150)),
        child: CustomContainer(
            child: Center(
              child: ContactUs(
                companyName: 'Scent Laundry',
                textColor: Colors.black,
                cardColor: Colors.white,
                companyColor: StaticColors.primaryColor,
                taglineColor: Colors.white,
                email: 'QaoudQa@gmail.com',
                phoneNumber: '0788828337',
                instagram: 'www.instagram.com/scentlaundry/',
                facebookHandle: 'www.facebook.com/scentlaundry/',
              ),
            )),
      ),
    );
  }
}
