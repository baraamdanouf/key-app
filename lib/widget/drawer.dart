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
        Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Center(
            child: Image.asset(
              logo,
              // height: 50.h,
              alignment: Alignment.topCenter,
              height: 88.h,
              width: 200.w,
            ),
          ),
        ),
        CustomText(
            text: 'اسم المستخدم',
            fontSize: 18.h,
            textColor: secondaryColor,
            bold: true,
            marginTop: 25.h,
            alignment: AlignmentDirectional.center),
        SizedBox(
          height: 30.h,
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'الرئيسية',
           textColor: textColor,
              bold: true,
           fontSize: 15.h),
          onTap: () {Get.back();},
          leading: Icon(
            Ionicons.home_outline,
            color: primaryColor,
            size: 30.h,
          ),
        ),
        Theme(
          data: Theme.of(Get.context!).copyWith(
         //   dividerColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.red,
          )
          ),
          child: ExpansionTile(
            title: CustomText(text: 'كلية الطب البشري - جامعة حلب',
                textColor: textColor,
                bold: true,
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
                                   bold: true,
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
        ),
        ExpansionTile(
          title: CustomText(text: 'كلية العلوم - جامعة حلب',
              textColor: textColor,
              bold: true,
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
                          bold: true,
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
          dense:true,
          title: CustomText(text: 'ملاحظاتي',
            textColor: textColor,
              bold: true,
            fontSize: 15.h),
          leading: Icon(
            Ionicons.clipboard_outline,
            color: primaryColor,
            size: 30.h,
          ),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'تفعيل كود',
            textColor: textColor,
              bold: true,
            fontSize: 15.h),
          leading: Icon(
            Ionicons.qr_code_outline,
            color: primaryColor,
            size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'إدارة الأكواد',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.card_outline,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'آخر الإشعارات',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.notifications_outline,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'حول التطبيق',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.information_outline,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'تواصل معنا',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.chatbubble_ellipses_outline,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'الإعدادات',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.settings_outline,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'الوضع الليلي',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.moon_outline,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'تحديث التطبيق',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.logo_google_playstore,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),
        ListTile(
          dense:true,
          title: CustomText(text: 'ما الجديد في هذه النسخة',
              textColor: textColor,
              bold: true,
              fontSize: 15.h),
          leading: Icon(
              Ionicons.gift_outline,
              color: primaryColor,
              size: 30.h),
          onTap: () {
            // controller.homeKey.currentState!.openEndDrawer();
            // Get.toNamed(PagesRoutes.error);
          },
        ),

]);
}