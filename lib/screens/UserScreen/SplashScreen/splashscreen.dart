import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import '../../../utils/Static/consvalue.dart';
import '../../../utils/Static/sharedpref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimationLeft;

  @override
  void initState() {
    super.initState();
    checkUserLogin();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _offsetAnimationLeft = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.fastEaseInToSlowEaseOut),
    ));
    _controller.forward();
  }

  checkUserLogin() {
    General.getPrefInt(ConsValues.id, 0).then(
          (value) {
        print(value);
        if (value == 0) {
          Timer(
            const Duration(seconds: 2),
                () => Get.offAllNamed(Approute.Login),
          );
        } else {
          General.getPrefInt(ConsValues.USER_TYPE, 0).then(
                (value) {
              print(value);
              if (value == 1) {
                Timer(
                  const Duration(seconds: 2),
                      () => Get.offAllNamed(Approute.HomeScreen),
                );
              } else {
                print(value);
                Timer(
                  const Duration(seconds: 2),
                      () => Get.offAllNamed(Approute.HomeScreen),
                );
              }
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StaticColors.primaryColor,
      body: Center(
        child: SizedBox(
          height: getProportionateScreenHeight(350),
          width: getProportionateScreenWidth(250),
          child: SlideTransition(
            position: _offsetAnimationLeft,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
