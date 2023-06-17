import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/login/login.dart';
import 'package:key_app/ui/onboarding/onboardingController.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/const_images.dart';
import 'package:key_app/widget/cuatom_button.dart';
import 'package:key_app/widget/custom_text.dart';

//Login page creation and binding with getx controller.
class OnBoarding extends GetView<OnBoardingController> {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get width and height of the screen.
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(OnBoardingController());
    return Scaffold(
      key: controller.onBoardingKey,
      body: Obx(()=> SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: 850.h,
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    SizedBox(height: 88.h),
                    Image.asset(logo, width: 160.w, height: 160.h),
                    SizedBox(height: 88.h),
                    CustomButton(
                        onPressed: () {
                          Get.to(const Login());
                        },
                        text: "تفعيل كرت",
                        width: 360.w,
                        border: 5.r,
                        height: 55.h,
                        textSize: 18.h,
                        bold: true,
                      ),
                    SizedBox(height: 15.h),
                    CustomButton(
                        onPressed: () {
                          Get.to(const Login());
                        },
                        text: "تسجيل دخول",
                        width: 360.w,
                        border: 5.r,
                        height: 55.h,
                        textSize: 18.h,
                        bold: true,
                        backgroundColor: primaryColor),
                    SizedBox(height: 8.h),
                    CustomText(
                        text: "تحتاج لمساعدة ؟ ",
                        fontSize: 16.h,
                        textColor: MainController.themeData.value.indicatorColor),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "نقاط البيع",
                          fontSize: 15.h,
                          bold: true,
                          underLine: true,
                          textColor: MainController.themeData.value.hintColor,
                          onPressed: () {},
                        ),
                        CustomText(
                          text: "|",
                          fontSize: 25.h,
                          marginStart: 5.w,
                          marginEnd: 5.w,
                          textAlign: TextAlign.center,
                          bold: true,
                          textColor: MainController.themeData.value.hintColor,
                          onPressed: () {
                          },
                        ),
                        CustomText(
                          text: "خطوات التفعيل",
                          fontSize: 15.h,
                          bold: true,
                          underLine: true,
                          textColor: MainController.themeData.value.hintColor,
                          onPressed: () {
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 25.h,)
                  ],
                ),

              ),
            )),
      ),
    );
  }
}
