import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/course_details/course_details.dart';
import 'package:key_app/ui/session_details/session_details_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom-shimmer-widget.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class SessionDetails extends GetView<SessionDetailsController> {
  const SessionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(SessionDetailsController());
    return DoubleBack(
      message: "من فضلك, اضغط زر الرجوع مرة أخرى لإغلاق التطبيق",
      background: MainController.themeData.value.primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: Scaffold(
            key: controller.sessionDetailsKey,
            drawer: Drawer(child: drawer()),
            body: Obx(()=> SafeArea(
                  child:SizedBox(
                      width: width,
                      height : height,
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
                                      onTap: (){ controller.sessionDetailsKey.currentState!.openDrawer();},
                                      child: Icon(Ionicons.menu_sharp,
                                        color: MainController.themeData.value.dividerColor, size: 35.h,)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        text: SaveDateInSharedPreference.getYearSessionName(),
                                        fontSize: 20.h,
                                        bold: true,
                                        alignment: AlignmentDirectional.center,
                                        textColor: MainController.themeData.value.dividerColor),
                                    CustomText(
                                        text: "كلية ${SaveDateInSharedPreference.getFacultyName()} - جامعة حلب",
                                        fontSize: 15.h,
                                        marginTop: 8.h,
                                        alignment: AlignmentDirectional.center,
                                        textColor: MainController.themeData.value.dividerColor),
                                  ],
                                ),
                              ],),),
                          SizedBox(height: 8.h,),
                          controller.isLoading.value?
                          Expanded(
                            child: SizedBox(
                              width: width,
                              child: ListView.builder(
                                  itemCount: 8,
                                  itemBuilder: (context, index)=> ShimmerWidget(child: Container(
                                    height: 70.h,
                                    color: primaryColor,
                                    margin: EdgeInsetsDirectional.only(top: 12.h, bottom: 12.h),
                                  ))),
                            ),
                          ):
                          controller.subjects.isEmpty ?
                              Expanded(
                                child: CustomText(text: 'لم يتم إضافة مواد بعد',
                                  textColor: MainController.themeData.value.indicatorColor,
                                  alignment: AlignmentDirectional.center,
                                ),
                              )
                            : Expanded(
                            child: SizedBox(
                              width: width,
                              child: ListView.builder(
                                  itemCount: controller.subjects.length,
                                  padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                                  itemBuilder: (context, index)=>
                                  courseItem(
                                      controller.subjects[index].subjectId,
                                      controller.subjects[index].name,
                                      controller.courseCount,
                                      controller.bankCount,
                                      controller.interviewCount,
                                      context)
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            ),
      ),
    );
  }
  Widget courseItem(int? subjectId, String? course, int? courseCount, int? bankCount,
      int? interviewCount, BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){
        Get.to(const CourseDetails());
        SaveDateInSharedPreference.setSubjectId(subjectId.toString());
        SaveDateInSharedPreference.setSubjectName(course!);
        },
      child: SizedBox(
          width: width,
          child:
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                      child: Center(
                        child: Icon(Ionicons.library_outline, color: MainController.themeData.value.hintColor, size: 35.h,)
                      ),
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: '$course',
                          fontSize: 18.h,
                          bold: true,
                          marginBottom: 12.h,
                          marginTop: 8.h,
                          textColor: MainController.themeData.value.indicatorColor),
                      Row(children: [
                        Icon(Ionicons.document_outline, color: MainController.themeData.value.hintColor, size: 18.h,),
                        CustomText(
                            text: '$courseCount',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: MainController.themeData.value.indicatorColor),
                        Icon(Ionicons.briefcase_outline, color: MainController.themeData.value.hintColor, size: 18.h,),
                        CustomText(
                            text: '$bankCount',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: MainController.themeData.value.indicatorColor),
                        Icon(Ionicons.newspaper_outline, color: MainController.themeData.value.hintColor, size: 18.h,),
                        CustomText(
                            text: '$interviewCount',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: MainController.themeData.value.indicatorColor),
                      ],)
                    ],),
                  const Spacer(),
                ],
              ),
               Divider(thickness: 0.8,color: MainController.themeData.value.indicatorColor.withOpacity(0.5))
            ],
          ),
        ),
    );
  }

}
