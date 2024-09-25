import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:libco_exchange/src/global/controllers/app.dart';
import 'package:libco_exchange/src/global/themes/app_theme.dart';
import 'package:libco_exchange/src/modules/splash/splash_screen.dart';

import 'lang.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  AppBinding().dependencies();
  // AuthBinding().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en', ''),
      title: 'Lybiano Exchange',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
