import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:key_app/ui/onboarding/onboarding.dart';
import 'package:key_app/ui/splash/splash_controller.dart';
import 'package:key_app/utils/const_images.dart';

class Splash extends GetView<SplashController> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Get.put(SplashController());
    Timer(const Duration(seconds: 3), ()=> Get.off(const OnBoarding()));
    return Scaffold(
      key: controller.splashKey,
      body: SafeArea(
        child: SizedBox(
          height: 800.h,
          width: width,
          child: Center(
            child: Image.asset(logoSplash,
                height: 250.h,
                width: 400.w,
            ))
          ),
        ),
    );
  }
}
