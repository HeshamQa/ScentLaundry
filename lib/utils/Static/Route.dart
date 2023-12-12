import 'package:flutter/material.dart';
import 'package:scentlaundry/screens/CartScreen/CartScreen.dart';
import 'package:scentlaundry/screens/CategoryScreen/CategoryScreen.dart';
import 'package:scentlaundry/screens/OrderStatusScreen/OrderStatusScreen.dart';
import '../../screens/ForgetPassword/ForgetPassword.dart';
import '../../screens/HomeScreen/HomeScreen.dart';
import '../../screens/LoginScreen/LoginScreen.dart';
import '../../screens/PaymentScreen/PaymentScreen.dart';
import '../../screens/PlaceOrder/PlaceOrder.dart';
import '../../screens/ProfileScreen/ProfileScreen.dart';
import '../../screens/SignUpScreen/SignUpScreen.dart';
import '../../screens/ContactUsScreen/ContactUsScreen.dart';
import '../../screens/MyOrders/MyOrders.dart';
import '../../screens/Pickup_Day/pickuptime2.dart';
import '../../screens/Pickup_Time/pickuptime.dart';
import '../../screens/Subscriptions/Subscriptions.dart';
import '../../screens/WalletScreen/WalletScreen.dart';


Map<String, Widget Function(BuildContext)> route = {
    Approute.Login: (context) => const LoginScreen(),
    Approute.Signup: (context) => const SignUpScreen(),
  Approute.ForgetScreen: (context) => const ForgetPassword(),
  Approute.HomeScreen: (context) => const HomeScreen(),
  Approute.CartScreen:(context) => const CartScreen(),
  Approute.CategoryScreen:(context) => const CategoryScreen(),
  Approute.ProfileScreen:(context) => const ProfileScreen(),
  Approute.PlaceOrder:(context) => const PlaceOrder(),
  Approute.pickuptime:(context) => const pickuptime(),
  Approute.pickuptime2:(context) => const pickuptime2(),
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
    static const String CategoryScreen="/CategoryScreen";
    static const String CartScreen="/CartScreen";
    static const String ProfileScreen="/ProfileScreen";
    static const String PlaceOrder="/PlaceOrder";
    static const String pickuptime="/pickuptime";
    static const String pickuptime2="/pickuptime2";
    static const String ContactUs="/Contact_Us";
    static const String MyOrder="/MyOrder";
    static const String WalletScreen="/WalletScreen";
    static const String PaymentScreen="/PaymentScreen";
    static const String Subscriptions="/Subscriptions";
    static const String OrderStatusScreen="/OrderStatusScreen";
  }