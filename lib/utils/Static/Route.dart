import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/CartScreen/CartScreen.dart';
import 'package:scentlaundry/screens/CategoryScreen/CategoryScreen.dart';
import 'package:scentlaundry/screens/SubDetails/SubDetails.dart';
import '../../screens/ForgetPassword/ForgetPassword.dart';
import '../../screens/HomeScreen/HomeScreen.dart';
import '../../screens/LoginScreen/LoginScreen.dart';
import '../../screens/ProfileScreen/ProfileScreen.dart';
import '../../screens/SignUpScreen/SignUpScreen.dart';

Map<String, Widget Function(BuildContext)> route = {
    Approute.Login: (context) => const LoginScreen(),
    Approute.Signup: (context) => const SignUpScreen(),
  Approute.ForgetScreen: (context) => const ForgetPassword(),
  Approute.HomeScreen: (context) => const HomeScreen(),
  Approute.CartScreen:(context) => const CartScreen(),
  Approute.CategoryScreen:(context) => const CategoryScreen(),
  Approute.SubDetails:(context) => const SubDetails(),
  Approute.ProfileScreen:(context) => const ProfileScreen(),
  };
  class Approute {
    static const String Login = "/LoginScreen";
    static const String Signup="/SignUpScreen";
    static const String ForgetScreen="/ForgetPassword";
    static const String HomeScreen="/HomeScreen";
    static const String CategoryScreen="/CategoryScreen";
    static const String CartScreen="/CartScreen";
    static const String SubDetails="/SubDetails";
    static const String ProfileScreen="/ProfileScreen";
  }