import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:scentlaundry/generated/l10n.dart';
import 'package:scentlaundry/screens/UserScreen/HomeScreen/HomeScreen.dart';
import 'package:scentlaundry/screens/UserScreen/LoginScreen/LoginScreen.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        isLoggedIn = false;
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        isLoggedIn = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Scent Laundry',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: StaticColors.primaryColor,
          centerTitle: true,
        ),
        fontFamily: 'Inter bold',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        useMaterial3: true,
      ),
      home: isLoggedIn ? const HomeScreen() : const LoginScreen(),
      routes: route,
    );
  }
}
