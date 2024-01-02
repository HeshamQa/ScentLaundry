import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:scentlaundry/controller/providers/categories.dart';
import 'package:scentlaundry/controller/providers/item_provider.dart';
import 'package:scentlaundry/controller/providers/pop_cate.dart';
import 'package:scentlaundry/controller/providers/cartprovider.dart';
import 'package:scentlaundry/controller/providers/image_banner.dart';
import 'package:scentlaundry/controller/providers/sub_controller.dart';
import 'package:scentlaundry/generated/l10n.dart';
import 'package:scentlaundry/screens/UserScreen/SplashScreen/splashscreen.dart';
import 'package:scentlaundry/utils/Static/Route.dart';
import 'package:scentlaundry/utils/Static/Size_Config.dart';
import 'package:scentlaundry/utils/Static/StaticColors.dart';
import 'controller/providers/subscribe_provider.dart';

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
    SizeConfig().init(context);
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
        ChangeNotifierProvider<CartProvider>(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider<SubController>(
          create: (_) => SubController(),
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
        home: const SplashScreen(),
        getPages: route.values.toList(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
