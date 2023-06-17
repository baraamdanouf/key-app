import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/course_questions/course_questions.dart';
import 'package:key_app/ui/courses/courses_controller.dart';
import 'package:key_app/ui/interviews/interviews_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class Interviews extends GetView<InterviewsController> {
  const Interviews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(InterviewsController());
    return Obx(()=> Scaffold(
          key: controller.interviewsKey,
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
                              onTap: (){ controller.interviewsKey.currentState!.openDrawer();},
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
                                text: "المقابلات (8)",
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
                                interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020'),
                                interviewItem('دورة 2020 - 2021, الفصل الثاني', context, '8','10/6/2020'),
                                interviewItem('دورة 2021 - 2022, الفصل الأول', context, '10', '10/6/2020'),
                                interviewItem('دورة 2021 -2022, الفصل الثاني', context, '15', '10/6/2020'),
                                interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020'),
                                interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020'),
                                interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020')
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
  Widget interviewItem(String? title, BuildContext context, String? questionNo, String? date) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){},
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
                      child: Icon(Ionicons.newspaper_outline, color: MainController.themeData.value.hintColor, size: 35.h,)
                  ),
                ),

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
                        textColor:MainController.themeData.value.indicatorColor),
                    CustomText(
                        text: 'عدد الأسئلة: $questionNo',
                        fontSize: 16.h,
                        textColor: MainController.themeData.value.indicatorColor),

                  ],),

                const Spacer(),
                Align(
                  child: CustomText(
                      text: "$date",
                      fontSize: 18.h,
                      marginEnd: 12.w,
                      textColor: MainController.themeData.value.indicatorColor),
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
