import 'package:flutter/material.dart';
import 'package:scentlaundry/view/screens/LoginScreen/LoginScreen.dart';
import 'package:scentlaundry/view/screens/SignUpScreen/SignUpScreenn.dart';

Map<String, Widget Function(BuildContext)> route = {
    Approute.Login: (context) => const LoginScreen(),
    Approute.Signup: (context) => const SignUpScreen(),
  };
  class Approute {
    static const String Login = "/LoginScreen";
    static const String Signup="/SignUpScreen";
  }