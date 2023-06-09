import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/course_questions/course_questions.dart';
import 'package:key_app/ui/courses/courses_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class Courses extends GetView<CoursesController> {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(CoursesController());
    return Scaffold(
        key: controller.coursesKey,
        drawer: Drawer(child: drawer()),
        body: Obx(()=> SafeArea(
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
                              onTap: (){ controller.coursesKey.currentState!.openDrawer();},
                              child: Icon(Ionicons.menu_sharp,
                                color: MainController.themeData.value.dividerColor, size: 35.h,)),
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
                                text: "الدورات (8)",
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
                                sortItem('دورة 2020 - 2021, الفصل الأول', context, '50'),
                                sortItem('دورة 2020 - 2021, الفصل الثاني', context, '8'),
                                sortItem('دورة 2021 - 2022, الفصل الأول', context, '10'),
                                sortItem('دورة 2021 -2022, الفصل الثاني', context, '15'),
                                sortItem('دورة 2020 - 2021, الفصل الأول', context, '50'),
                                sortItem('دورة 2020 - 2021, الفصل الأول', context, '50'),
                                sortItem('دورة 2020 - 2021, الفصل الأول', context, '50')
                              ],
                            ))
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
  Widget sortItem(String? title, BuildContext context, String? questionNo) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){
        Get.to(const CourseQuestions());
        },
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18.w),
                    child: Icon(Ionicons.document_outline, size: 30.h,
                        color: MainController.themeData.value.hintColor)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: '$title',
                        fontSize: 18.h,
                        bold: true,
                        marginBottom: 12.h,
                        marginTop: 8.h,
                        textColor: MainController.themeData.value.indicatorColor),
                    Row(children: [
                      CustomText(
                          text: 'عدد الأسئلة :',
                          fontSize: 15.h,
                          textColor: MainController.themeData.value.indicatorColor),
                      CustomText(
                          text: '$questionNo',
                          fontSize: 15.h,
                          textColor: MainController.themeData.value.indicatorColor),

                    ],)
                  ],),
                const Spacer(),
                Center(
                  child: Container(
                    width: 20.w,
                    height: 20.h,
                    margin: EdgeInsetsDirectional.only(end: 12.w),
                    decoration: const BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
              ],
            ),
             Divider(thickness: 0.8,color: MainController.themeData.value.indicatorColor.withOpacity(0.5))
          ],
        ),
      ),
    );
  }

}
