import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/Categories.dart';
import 'package:scentlaundry/controller/providers/ItemProvider.dart';
import 'package:scentlaundry/controller/providers/PopCate.dart';
import 'package:scentlaundry/controller/providers/imagebanner.dart';
import 'package:scentlaundry/generated/l10n.dart';
import 'package:scentlaundry/screens/UserScreen/HomeScreen/HomeScreen.dart';
import 'package:scentlaundry/screens/UserScreen/LoginScreen/LoginScreen.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'package:scentlaundry/utils/Static/sharedpref.dart';

import 'controller/providers/subscripeprovider.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CategoriesProvider>(
          create: (_) => CategoriesProvider(),
        ),
        ChangeNotifierProvider<ImageBannerProvider>(
          create: (_) => ImageBannerProvider(),
        ),
        ChangeNotifierProvider<PopCateProvider>(
          create: (_) => PopCateProvider(),
        ),
        ChangeNotifierProvider<ItemProvider>(
          create: (_) => ItemProvider(),
        ),
        ChangeNotifierProvider<SubscribeProvider>(
          create: (_) => SubscribeProvider(),
        ),
      ],
      child: GetMaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: const Locale('ar'),
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
        home: General.getPrefInt('id', 3) == 3
            ? const LoginScreen()
            : General.getPrefInt('idusertype', 1) == 1
                ? const HomeScreen()
                : const HomeScreen(),
        routes: route,
        builder: EasyLoading.init(),
      ),
    );
  }
}
