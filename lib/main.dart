import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/home/home.dart';
import 'package:key_app/ui/splash/splash.dart';
import 'package:key_app/utils/const_colors.dart';
import 'utils/shared_preferance/shared_preferance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveDateInSharedPreference.init();
  HttpOverrides.global =  MyHttp();
  // Disable screenshots and video recording
  FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  runApp(const MyApp());
}

class MyApp extends GetView<MainController> {
 const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Get.put(MainController());
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        locale: const Locale('ar'),
        theme: ThemeService().lightTheme,
        darkTheme: ThemeService().darkTheme,
        themeMode: controller.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      ),
    );
  }
}

class MyHttp extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}