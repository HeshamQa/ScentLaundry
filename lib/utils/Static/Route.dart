import 'package:flutter/material.dart';

import '../../screens/UserScreen/CartScreen/CartScreen.dart';
import '../../screens/UserScreen/ContactUsScreen/ContactUsScreen.dart';
import '../../screens/UserScreen/ForgetPassword/ForgetPassword.dart';
import '../../screens/UserScreen/HomeScreen/HomeScreen.dart';
import '../../screens/UserScreen/LoginScreen/LoginScreen.dart';
import '../../screens/UserScreen/MyOrders/MyOrders.dart';
import '../../screens/UserScreen/OrderStatusScreen/OrderStatusScreen.dart';
import '../../screens/UserScreen/PaymentScreen/PaymentScreen.dart';
import '../../screens/UserScreen/PickupDayScreen/PickupDayScreen.dart';
import '../../screens/UserScreen/PlaceOrder/PlaceOrder.dart';
import '../../screens/UserScreen/ProfileScreen/ProfileScreen.dart';
import '../../screens/UserScreen/ReceiptDayScreen/ReceiptDayScreen.dart';
import '../../screens/UserScreen/SignUpScreen/SignUpScreen.dart';
import '../../screens/UserScreen/Subscriptions/Subscriptions.dart';
import '../../screens/UserScreen/WalletScreen/WalletScreen.dart';


Map<String, Widget Function(BuildContext)> route = {
    Approute.Login: (context) => const LoginScreen(),
    Approute.Signup: (context) => const SignUpScreen(),
  Approute.ForgetScreen: (context) => const ForgetPassword(),
  Approute.HomeScreen: (context) => const HomeScreen(),
  Approute.CartScreen:(context) => const CartScreen(),
  Approute.ProfileScreen:(context) => const ProfileScreen(),
  Approute.PlaceOrder:(context) => const PlaceOrder(),
  Approute.PickupDayScreen:(context) => const PickupDayScreen(),
  Approute.ReceiptTime:(context) => const ReceiptTime(),
  Approute.ContactUs:(context) => const Contact_Us(),
  Approute.MyOrder:(context) => const MyOrder(),
  Approute.WalletScreen:(context) => const WalletScreen(),
  Approute.Subscriptions:(context) => const Subscriptions(),
  Approute.PaymentScreen:(context) => const PaymentScreen(),
  Approute.OrderStatusScreen:(context) => const OrderStatusScreen(),
  };
  class Approute {
    static const String Login = "/LoginScreen";
    static const String Signup="/SignUpScreen";
    static const String ForgetScreen="/ForgetPassword";
    static const String HomeScreen="/HomeScreen";
    static const String CartScreen="/CartScreen";
    static const String ProfileScreen="/ProfileScreen";
    static const String PlaceOrder="/PlaceOrder";
    static const String PickupDayScreen="/PickupDayScreen";
    static const String ReceiptTime="/ReceiptTime";
    static const String ContactUs="/Contact_Us";
    static const String MyOrder="/MyOrder";
    static const String WalletScreen="/WalletScreen";
    static const String PaymentScreen="/PaymentScreen";
    static const String Subscriptions="/Subscriptions";
    static const String OrderStatusScreen="/OrderStatusScreen";
  }