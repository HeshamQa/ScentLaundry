import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/CategoryScreen/CategoryScreen.dart';
import '../../screens/ForgetPassword/ForgetPassword.dart';
import '../../screens/HomeScreen/HomeScreen.dart';
import '../../screens/LoginScreen/LoginScreen.dart';
import '../../screens/SignUpScreen/SignUpScreenn.dart';

Map<String, Widget Function(BuildContext)> route = {
    Approute.Login: (context) => const LoginScreen(),
    Approute.Signup: (context) => const SignUpScreen(),
  Approute.ForgetScreen: (context) => const ForgetPassword(),
  Approute.HomeScreen: (context) => const HomeScreen(),
  Approute.CategoryScreen:(context) => const CategoryScreen(),
  };
  class Approute {
    static const String Login = "/LoginScreen";
    static const String Signup="/SignUpScreen";
    static const String ForgetScreen="/ForgetPassword";
    static const String HomeScreen="/HomeScreen";
    static const String CategoryScreen="/CategoryScreen";
  }