import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/subject_info/subject_info_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class SubjectInfo extends GetView<SubjectInfoController> {
  const SubjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(SubjectInfoController());
    return Obx(()=> Scaffold(
          key: controller.subjectInfoKey,
          drawer: Drawer(child: drawer()),
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
                              onTap: (){ controller.subjectInfoKey.currentState!.openDrawer();},
                              child: Icon(Ionicons.menu_sharp, color: MainController.themeData.value.dividerColor, size: 35.h,)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "أطفال 1",
                                fontSize: 20.h,
                                bold: true,
                                alignment: AlignmentDirectional.center,
                                textColor: MainController.themeData.value.dividerColor),
                            CustomText(
                                text: "حول المادة",
                                fontSize: 15.h,
                                marginTop: 8.h,
                                alignment: AlignmentDirectional.center,
                                textColor: MainController.themeData.value.dividerColor),
                          ],
                        ),
                      ],),),
                  //  SizedBox(height: 15.h,),
                  Expanded(
                    child: SingleChildScrollView(
                        child:  Container(
                            padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 15.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    infoItem('9', 'عدد الدورات',Ionicons.document_outline, context, Colors.yellowAccent),
                                    infoItem('12','عدد البنوك', Ionicons.briefcase_outline, context, yellow),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    infoItem('1200', 'عدد الأسئلة',Ionicons.help_sharp, context, Colors.lightGreenAccent),
                                    infoItem('12','اسئلة المقابلات', Ionicons.newspaper_outline, context, brownLight),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    infoItem('1200', 'عدد التاغات',Ionicons.pricetags_outline, context, Colors.blueAccent),
                                    infoItem('12','الاسئلة الصحيحة', Ionicons.checkbox_outline, context, Colors.greenAccent),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    infoItem('1200', 'الأسئلة المفضلة',Ionicons.heart_outline, context, pink),
                                   SizedBox(width: width/2 - 25.w,)
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
                                  decoration: BoxDecoration(
                                      color: MainController.themeData.value.dividerColor,
                                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: "بعض المعلومات حول المادة",
                                          fontSize: 18.h,
                                          marginBottom: 15.h,
                                          marginTop: 25.h,
                                          marginStart: 8.w,
                                          bold: true,
                                          textAlign: TextAlign.center,
                                          textColor: textColor),
                                       const Divider(thickness: 1, color: textColor),
                                      CustomText(
                                          text: " هذه المادة سهلة وممتعة هذه المادة سهلة وممتعة هذه المادة سهلة وممتعة هذه المادة سهلة وممتعة هذه المادة سهلة وممتعة هذه المادة سهلة وممتعة هذه المادة سهلة وممتعة",
                                          fontSize: 16.h,
                                          marginStart: 8.w,
                                          marginBottom: 12.h,
                                          heightText: 1.5,
                                          textColor: textColor),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w, vertical: 12.h),
                                  decoration: BoxDecoration(
                                      color:  MainController.themeData.value.dividerColor,
                                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                          text: "تصنيفات المادة حسب تكرار ورودها",
                                          fontSize: 18.h,
                                          marginBottom: 15.h,
                                          marginTop: 25.h,
                                          marginStart: 8.w,
                                          bold: true,
                                          textAlign: TextAlign.center,
                                          textColor: textColor),
                                      const Divider(thickness: 1, color: textColor,),
                                      sortSubjectItem('مكرر', '800'),
                                      sortSubjectItem('الاضطرابات التنفسية', '800'),
                                      sortSubjectItem('يرقانات', '800'),
                                      sortSubjectItem('مكرر', '800'),
                                      sortSubjectItem('الاضطرابات التنفسية', '800'),
                                      sortSubjectItem('يرقانات', '800'),
                                      sortSubjectItem('مكرر', '800'),
                                      sortSubjectItem('الاضطرابات التنفسية', '800'),
                                      sortSubjectItem('يرقانات', '800'),

                                    ],
                                  ),
                                )
                              ],
                            ))
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
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
            const Divider(thickness: 0.8,color: textColor,)
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
            color: SaveDateInSharedPreference.getTheming() ? bgColor.withOpacity(0.5):
            bgColor.withOpacity(0.25),
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        height: 100.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Icon(iconData, size: 35.h,color: MainController.themeData.value.indicatorColor),
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
                    textColor: MainController.themeData.value.indicatorColor),
                CustomText(
                    text: "$infoNo",
                    fontSize: 16.h,
                    alignment: AlignmentDirectional.center,
                    textColor: MainController.themeData.value.indicatorColor),
              ],
            ),
          ],
        ),
    );
  }

}
