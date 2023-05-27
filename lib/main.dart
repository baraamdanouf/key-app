import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:key_app/ui/splash/splash.dart';
import 'package:key_app/utils/const_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Splash(),
        locale: const Locale('ar'),
        theme: ThemeData( fontFamily: 'Almarai',
          primarySwatch: Colors.green,
        ),
      ),
    );
  }
}