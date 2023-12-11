import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/ContactUsScreen/ContactUsScreen.dart';
import 'package:scentlaundry/screens/MyOrders/MyOrders.dart';
import 'package:scentlaundry/screens/WalletScreen/WalletScreen.dart';
import '../../screens/CartScreen/CartScreen.dart';
import '../../screens/CategoryScreen/CategoryScreen.dart';
import '../../screens/ForgetPassword/ForgetPassword.dart';
import '../../screens/HomeScreen/HomeScreen.dart';
import '../../screens/LoginScreen/LoginScreen.dart';
import '../../screens/PlaceOrder/PlaceOrder.dart';
import '../../screens/ProfileScreen/ProfileScreen.dart';
import '../../screens/SignUpScreen/SignUpScreen.dart';

Map<String, Widget Function(BuildContext)> route = {
  Approute.Login: (context) => const LoginScreen(),
  Approute.Signup: (context) => const SignUpScreen(),
  Approute.ForgetScreen: (context) => const ForgetPassword(),
  Approute.HomeScreen: (context) => const HomeScreen(),
  Approute.CartScreen:(context) => const CartScreen(),
  Approute.CategoryScreen:(context) => const CategoryScreen(),
  Approute.ProfileScreen:(context) => const ProfileScreen(),
  Approute.PlaceOrder:(context) => const PlaceOrder(),
  Approute.MyOrder:(context) => const MyOrder(),
  Approute.ContactUs:(context) => const Contact_Us(),
  Approute.WalletScreen:(context) => const WalletScreen(),
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
  static const String MyOrder="/MyOrder";
  static const String ContactUs = "/ContactUs";
  static const String WalletScreen = "/WalletScreen";
}