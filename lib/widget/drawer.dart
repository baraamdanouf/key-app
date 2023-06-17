import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/question_answer/question_answer.dart';
import 'package:key_app/ui/settings/settings.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/const_images.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom_text.dart';
import '../ui/home/home.dart';

Widget drawer ()
{
  RxBool isDark = SaveDateInSharedPreference.getTheming().obs;

  void toggleTheme() async{
    isDark.value = !isDark.value;

    if(isDark.value)
      {
        SaveDateInSharedPreference.setTheming(true);
        Get.changeTheme(ThemeService().darkTheme);
        Get.changeThemeMode(ThemeMode.dark);
        MainController.themeData.value = ThemeService().darkTheme;
      }
    else
      {
        SaveDateInSharedPreference.setTheming(false);
        Get.changeTheme(ThemeService().lightTheme);
        Get.changeThemeMode(ThemeMode.light);
        MainController.themeData.value = ThemeService().lightTheme;
      }
  }
  return Obx(()=> ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: Center(
              child: Image.asset(
                logo,
                alignment: Alignment.topCenter,
                height: 88.h,
                width: 200.w,
              ),
            ),
          ),
          CustomText(
              text: 'أحمد زكريا حجار',
              fontSize: 18.h,
              textColor: MainController.themeData.value.buttonColor,
              bold: true,
              marginTop: 25.h,
              alignment: AlignmentDirectional.center),
          SizedBox(
            height: 30.h,
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'الرئيسية',
             textColor: MainController.themeData.value.indicatorColor,
                bold: true,
             fontSize: 15.h),
            onTap: () {
              Get.back();
              Get.to(const Home());},
            leading: Icon(
              Ionicons.home_outline,
              color: MainController.themeData.value.hintColor,
              size: 30.h,
            ),
          ),
        ExpansionTile(
              title: CustomText(text: 'كلية الطب البشري - جامعة حلب',
                  textColor: MainController.themeData.value.indicatorColor,
                  bold: true,
                  fontSize: 15.h),
              leading: Icon(
                Ionicons.flask_outline,
                color:  MainController.themeData.value.hintColor,
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
                            color: MainController.themeData.value.hintColor,
                          ),
                          CustomText(text: 'السنة الخامسة - الفصل الأول',
                                textColor: MainController.themeData.value.indicatorColor,
                                 bold: true,
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
          ExpansionTile(
            title: CustomText(text: 'كلية العلوم - جامعة حلب',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.flask_outline,
                color: MainController.themeData.value.hintColor,
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
                          color: MainController.themeData.value.hintColor,
                        ),
                        CustomText(text: 'السنة الخامسة - الفصل الأول',
                            textColor: MainController.themeData.value.indicatorColor,
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
              textColor: MainController.themeData.value.indicatorColor,
                bold: true,
              fontSize: 15.h),
            leading: Icon(
              Ionicons.clipboard_outline,
              color: MainController.themeData.value.hintColor,
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
              textColor: MainController.themeData.value.indicatorColor,
                bold: true,
              fontSize: 15.h),
            leading: Icon(
              Ionicons.qr_code_outline,
              color: MainController.themeData.value.hintColor,
              size: 30.h),
            onTap: () {
              // controller.homeKey.currentState!.openEndDrawer();
              // Get.toNamed(PagesRoutes.error);
            },
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'إدارة الأكواد',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.card_outline,
                color: MainController.themeData.value.hintColor,
                size: 30.h),
            onTap: () {
              // controller.homeKey.currentState!.openEndDrawer();
              // Get.toNamed(PagesRoutes.error);
            },
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'آخر الإشعارات',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.notifications_outline,
                color: MainController.themeData.value.hintColor,
                size: 30.h),
            onTap: () {
              // controller.homeKey.currentState!.openEndDrawer();
              // Get.toNamed(PagesRoutes.error);
            },
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'حول التطبيق',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.information_outline,
                color: MainController.themeData.value.hintColor,
                size: 30.h),
            onTap: () {
              Get.back();
              Get.to(const QuestionsAnswers());
            },
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'تواصل معنا',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.chatbubble_ellipses_outline,
                color: MainController.themeData.value.hintColor,
                size: 30.h),
            onTap: () {
              // controller.homeKey.currentState!.openEndDrawer();
              // Get.toNamed(PagesRoutes.error);
            },
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'الإعدادات',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.settings_outline,
                color: MainController.themeData.value.hintColor,
                size: 30.h),
            onTap: () {
              Get.back();
              Get.to(const Settings());
            },
          ),
          Obx(()=> ListTile(
              dense:true,
              title: CustomText(text: isDark.value ? 'الوضع النهاري': 'الوضع الليلي',
                  textColor: MainController.themeData.value.indicatorColor,
                  bold: true,
                  fontSize: 15.h),
              leading: Icon(
               isDark.value ? Ionicons.moon_sharp : Ionicons.moon_outline,
                  color: MainController.themeData.value.hintColor,
                  size: 30.h),
              onTap: () {toggleTheme();},
            ),
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'تحديث التطبيق',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.logo_google_playstore,
                color: MainController.themeData.value.hintColor,
                size: 30.h),
            onTap: () {
              // controller.homeKey.currentState!.openEndDrawer();
              // Get.toNamed(PagesRoutes.error);
            },
          ),
          ListTile(
            dense:true,
            title: CustomText(text: 'ما الجديد في هذه النسخة',
                textColor: MainController.themeData.value.indicatorColor,
                bold: true,
                fontSize: 15.h),
            leading: Icon(
                Ionicons.gift_outline,
                color: MainController.themeData.value.hintColor,
                size: 30.h),
            onTap: () {
            },
          ),

]),
  );
}