import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/settings/settings_controller.dart';
import 'package:key_app/ui/subject_info/subject_info_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';

class Settings extends GetView<SettingsController> {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(SettingsController());
    return Scaffold(
        key: controller.settingsKey,
        body: SafeArea(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                Container(
                  width: width, height: 85.h,color: MainController.themeData.value.primaryColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 12.w, left: 18.w),
                        child: InkWell(
                            onTap: (){Get.back();},
                            child: Icon(Ionicons.arrow_forward_outline, color:
                            MainController.themeData.value.dividerColor, size: 25.h,)),
                      ),
                      CustomText(
                          text: "الإعدادات",
                          fontSize: 20.h,
                          bold: true,
                          alignment: AlignmentDirectional.center,
                          textColor: MainController.themeData.value.dividerColor),
                    ],),),
                //  SizedBox(height: 15.h,),
                Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                          padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                  text: "عام",
                                  fontSize: 18.h,
                                  marginStart: 30.w,
                                  marginTop: 30.h,
                                  marginBottom: 30.h,
                                  bold: true,
                                  textColor: MainController.themeData.value.buttonColor),
                              CustomText(
                                  text: "الاسم الكامل",
                                  fontSize: 20.h,
                                  marginStart: 30.w,
                                  marginBottom: 8.h,
                                  bold: true,
                                  textColor: MainController.themeData.value.indicatorColor),
                              CustomText(
                                  text: "أحمد زكريا حجار",
                                  fontSize: 18.h,
                                  marginStart: 30.w,
                                  marginBottom: 8.h,
                                  textColor: MainController.themeData.value.indicatorColor),
                               Divider(thickness: 1, color: MainController.themeData.value.indicatorColor.withOpacity(0.5),),
                              CustomText(
                                  text: "الدورات و البنوك",
                                  fontSize: 18.h,
                                  marginStart: 30.w,
                                  marginTop: 30.h,
                                  marginBottom: 30.h,
                                  bold: true,
                                  textColor: MainController.themeData.value.buttonColor),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: "حفظ آخر وصول ضمن المستند",
                                          fontSize: 20.h,
                                          marginStart: 30.w,
                                          marginBottom: 8.h,
                                          bold: true,
                                          textColor: MainController.themeData.value.indicatorColor),
                                      CustomText(
                                          text: "تستخدم لحفظ موضع آخر وصول تم رؤيته ضمن المستند بالإضافة إلى الحلول",
                                          fontSize: 18.h,
                                          marginStart: 30.w,
                                          width: width/2,
                                          marginBottom: 8.h,
                                          textColor: MainController.themeData.value.indicatorColor),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(end: 12.w),
                                    child: Obx(()=> Switch(
                                        activeColor: MainController.themeData.value.primaryColor,
                                        inactiveThumbColor: greyLite,
                                        inactiveTrackColor: grey,
                                        value: controller.isEnabled.value,
                                        onChanged: (val){
                                      controller.isEnabled.value = val;
                                        })),
                                  )
                                ],
                              ),
                              CustomText(
                                  text: "حذف بيانات المستندات المؤقتة",
                                  fontSize: 20.h,
                                  marginStart: 30.w,
                                  marginBottom: 8.h,
                                  marginTop: 30.h,
                                  bold: true,
                                  textColor: MainController.themeData.value.indicatorColor),
                              CustomText(
                                  text: "سيتم حذف موضع آخر سؤال تم رؤويته ضمن جميعب السمتندات بالإضافة إلى جميع الحلول (288)",
                                  fontSize: 18.h,
                                  marginStart: 30.w,
                                  marginBottom: 8.h,
                                  marginEnd: 30.w,
                                  textColor: MainController.themeData.value.indicatorColor),
                            ],
                          ))
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
  Widget sortSubjectItem(String? title, String? questionNo) {
    return Container(
      //   width: width,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                  text: '$title',
                  fontSize: 15.h,
                  textColor: textColor),
              CustomText(
                  text: '$questionNo',
                  fontSize: 15.h,
                  textColor: textColor),

            ],),
          SizedBox(height: 8.h),
          const Divider(thickness: 0.8)
        ],
      ),
    );
  }
  Widget infoItem(String? title, String? infoNo,IconData? iconData , BuildContext context, Color bgColor) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width/2 - 25.w,
      margin: EdgeInsetsDirectional.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
          color: bgColor.withOpacity(0.25),
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Icon(iconData, size: 35.h,color: Colors.black.withOpacity(0.8)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "$title",
                  fontSize: 18.h,
                  marginBottom: 5.h,
                  bold: true,
                  alignment: AlignmentDirectional.center,
                  textColor: textColor),
              CustomText(
                  text: "$infoNo",
                  fontSize: 16.h,
                  alignment: AlignmentDirectional.center,
                  textColor: textColor),
            ],
          ),
        ],
      ),
    );
  }

}
