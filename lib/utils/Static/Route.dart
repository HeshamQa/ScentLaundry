import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/CartScreen/CartScreen.dart';
import 'package:scentlaundry/screens/CategoryScreen/CategoryScreen.dart';
import 'package:scentlaundry/screens/Pickup_Time/pickuptime.dart';
import '../../screens/ForgetPassword/ForgetPassword.dart';
import '../../screens/HomeScreen/HomeScreen.dart';
import '../../screens/LoginScreen/LoginScreen.dart';
import '../../screens/Pickup_Day/pickuptime2.dart';
import '../../screens/PlaceOrder/PlaceOrder.dart';
import '../../screens/ProfileScreen/ProfileScreen.dart';
import '../../screens/SignUpScreen/SignUpScreen.dart';
import '../../screens/Subscriptions/Subscriptions.dart';

Map<String, Widget Function(BuildContext)> route = {
    Approute.Login: (context) => const LoginScreen(),
    Approute.Signup: (context) => const SignUpScreen(),
  Approute.ForgetScreen: (context) => const ForgetPassword(),
  Approute.HomeScreen: (context) => const HomeScreen(),
  Approute.CartScreen:(context) => const CartScreen(),
  Approute.CategoryScreen:(context) => const CategoryScreen(),
  Approute.ProfileScreen:(context) => const ProfileScreen(),
  Approute.PlaceOrder:(context) => const PlaceOrder(),
  Approute.pickuptime:(context)=> const pickuptime(),
  Approute.pickuptime2:(context)=> const pickuptime2(),
  Approute.Subscriptions:(context)=> const Subscriptions(),
  };
  class Approute {
    static const String Login = "/LoginScreen";
    static const String Signup="/SignUpScreen";
    static const String ForgetScreen="/ForgetPassword";
    static const String HomeScreen="/HomeScreen";
    static const String CategoryScreen="/CategoryScreen";
    static const String CartScreen="/CartScreen";
    static const String ProfileScreen="/ProfileScreen";
    static const String PlaceOrder="/PlaceOrder";
    static const String pickuptime="/PickupTime";
    static const String pickuptime2="/PickupTime2";
    static const String Subscriptions="/subscriptions";
  }