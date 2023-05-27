import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/ui/Home/home.dart';
import 'package:key_app/ui/login/login_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/const_images.dart';
import 'package:key_app/widget/cuatom_button.dart';
import 'package:key_app/widget/custom_text.dart';

//Login page creation and binding with getx controller.
class Login extends GetView<LoginController> {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get width and height of the screen.
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(LoginController());
    return Scaffold(
        key: controller.loginKey,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Container(
            height: 850.h,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Image.asset(logo, width: 150.w, height: 150.h),
                SizedBox(height: 50.h),
                Form(key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                          labelText: "الاسم الكامل",
                          labelStyle: TextStyle(
                              color: textColor,
                              fontSize: 16.h,
                              fontWeight: FontWeight.w500),
                        ),
                        keyboardType: TextInputType.text,
                        controller: controller.controllerName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "قم بإدخال اسمك الكامل بصيغة صحيحة";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 25.h),
                      TextFormField(
                        decoration: InputDecoration(
                          //     focusColor: Colors.red,
                          border:  const OutlineInputBorder(),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: primaryColor)),
                          labelText: "كود التفعيل",
                          labelStyle: TextStyle(
                              color: textColor,
                              fontSize: 16.h,
                              fontWeight: FontWeight.w500),
                        ),
                        keyboardType: TextInputType.number,
                        controller: controller.controllerCode,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "قم بإدخال كود التفعيل بصيغة صحيحة";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                CustomButton(
                    onPressed: () {
                      final isValid =
                          controller.loginFormKey.currentState!.validate();
                      if (!isValid) {
                        return;
                      } else {
                        Get.offAll(const Home());
                      }
                      controller.loginFormKey.currentState!.save();
                    },
                    text: "تفعيل",
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
                  textColor: textColor),
                const Spacer(),
                Row(children: [
                  const Spacer(),
                  CustomText(
                    text: "نقاط البيع",
                    fontSize: 15.h,
                    bold: true,
                    underLine: true,
                    textColor: primaryColor,
                    marginStart: 45.w),
                  CustomText(
                    text: "|",
                    fontSize: 25.h,
                    marginStart: 5.w,
                    marginEnd: 5.w,
                    textAlign: TextAlign.center,
                    bold: true,
                    textColor: primaryColor),
                  CustomText(
                    text: "خطوات التفعيل",
                    fontSize: 15.h,
                    bold: true,
                    underLine: true,
                    textColor: primaryColor),
                  const Spacer(),
                  InkWell(
                    overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
                    onTap: () {},
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                      child: Icon(
                        Ionicons.qr_code,
                        color: Colors.white,
                        size: 25.w,
                      ),
                    ),
                  )]),
                SizedBox(height: 25.h)
              ],
            ),

          ),
        )),
    );
  }
}
