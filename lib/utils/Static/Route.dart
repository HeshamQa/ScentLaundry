import 'package:get/get.dart';
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

Map<String, GetPage> route = {
  Approute.Login: GetPage(
      name: Approute.Login,
      page: () => const LoginScreen(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.Signup: GetPage(
      name: Approute.Signup,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.ForgetScreen: GetPage(
      name: Approute.ForgetScreen,
      page: () => const ForgetPassword(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.HomeScreen: GetPage(
      name: Approute.HomeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.CartScreen: GetPage(
      name: Approute.CartScreen,
      page: () => const CartScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.ProfileScreen: GetPage(
      name: Approute.ProfileScreen,
      page: () => const ProfileScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.PlaceOrder: GetPage(
      name: Approute.PlaceOrder,
      page: () => const PlaceOrder(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.PickupDayScreen: GetPage(
      name: Approute.PickupDayScreen,
      page: () => const PickupDayScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.ReceiptTime: GetPage(
      name: Approute.ReceiptTime,
      page: () => const ReceiptTime(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.ContactUs: GetPage(
      name: Approute.ContactUs,
      page: () => const Contact_Us(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.MyOrder: GetPage(
      name: Approute.MyOrder,
      page: () => const MyOrder(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.WalletScreen: GetPage(
      name: Approute.WalletScreen,
      page: () => const WalletScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.Subscriptions: GetPage(
      name: Approute.Subscriptions,
      page: () => const Subscriptions(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.PaymentScreen: GetPage(
      name: Approute.PaymentScreen,
      page: () => const PaymentScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
  Approute.OrderStatusScreen: GetPage(
      name: Approute.OrderStatusScreen,
      page: () => const OrderStatusScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 900)),
};

class Approute {
  static const String Login = "/LoginScreen";
  static const String Signup = "/SignUpScreen";
  static const String ForgetScreen = "/ForgetPassword";
  static const String HomeScreen = "/HomeScreen";
  static const String CartScreen = "/CartScreen";
  static const String ProfileScreen = "/ProfileScreen";
  static const String PlaceOrder = "/PlaceOrder";
  static const String PickupDayScreen = "/PickupDayScreen";
  static const String ReceiptTime = "/ReceiptTime";
  static const String ContactUs = "/Contact_Us";
  static const String MyOrder = "/MyOrder";
  static const String WalletScreen = "/WalletScreen";
  static const String PaymentScreen = "/PaymentScreen";
  static const String Subscriptions = "/Subscriptions";
  static const String OrderStatusScreen = "/OrderStatusScreen";
}
