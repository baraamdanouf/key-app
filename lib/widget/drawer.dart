import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/const_images.dart';
import 'package:key_app/widget/custom_text.dart';

Widget drawer ()
{
  return ListView(
      children: <Widget>[
        DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(book),
                    fit: BoxFit.fill)),
            child: IconButton(
              alignment: Alignment.topLeft,
              icon: Icon(
                Ionicons.person_circle_outline,
                size: 60.sp,
                color: primaryColor,
              ),
              onPressed: () {
                Get.back();
              },
            )),
        ListTile(
          title: CustomText(text: 'الرئيسية',
           textColor: textColor,
           fontSize: 15.h),
          onTap: () {Get.back();},
          leading: Icon(
            Ionicons.home_outline,
            color: primaryColor,
            size: 30.h,
          ),
        ),

        ExpansionTile(
          title: CustomText(text: 'كلية الطب البشري - جامعة حلب',
              textColor: textColor,
              fontSize: 15.h),
          leading: Icon(
            Ionicons.flask_outline,
            color: primaryColor,
            size: 30.h),
          children: <Widget>[
            GestureDetector(
              child: SizedBox(
                  width: 250.w,
                  height: 20.h,
                  child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Ionicons.school_outline,
                            size: 20.h,
                            color: primaryColor,
                          ),
                          CustomText(text: 'السنة الخامسة - الفصل الأول',
                                textColor: textColor,
                                marginStart: 8.w,
                                fontSize: 15.h)
                        ],
                      ),
                  )),
              onTap: () async {
                // controller.homeKey.currentState!.openEndDrawer();
                // Get.toNamed(PagesRoutes.personal);
              },
            ),
            SizedBox(height: 12.h)
          ],
        ),
        ExpansionTile(
          title: CustomText(text: 'كلية العلوم - جامعة حلب',
              textColor: textColor,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.flask_outline,
              color: primaryColor,
              size: 30.h),
          children: <Widget>[
            GestureDetector(
              child: SizedBox(
                  width: 250.w,
                  height: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Ionicons.school_outline,
                        size: 20.h,
                        color: primaryColor,
                      ),
                      CustomText(text: 'السنة الخامسة - الفصل الأول',
                          textColor: textColor,
                          marginStart: 8.w,
                          fontSize: 15.h)
                    ],
                  )),
              onTap: () async {
                // controller.homeKey.currentState!.openEndDrawer();
                // Get.toNamed(PagesRoutes.personal);
              },
            ),
            SizedBox(height: 12.h)
          ],
        ),

        ListTile(
          title: CustomText(text: 'ملاحظاتي',
            textColor: textColor,
            marginStart: 8.w,
            fontSize: 15.h),
          leading: Icon(
            Ionicons.clipboard_outline,
            color: primaryColor,
            size: 33.sp,
          ),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          title: CustomText(text: 'تفعيل الكود',
            textColor: textColor,
            marginStart: 8.w,
            fontSize: 15.h),
          leading: Icon(
            Icons.qr_code_outlined,
            color: primaryColor,
            size: 33.sp),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
]);
}