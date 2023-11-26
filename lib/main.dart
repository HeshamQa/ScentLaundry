import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/Route.dart';
import 'package:scentlaundry/view/screens/LoginScreen/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter bold',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: route,
    );
  }
}