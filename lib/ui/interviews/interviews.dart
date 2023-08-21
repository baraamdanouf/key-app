import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/interviews/interviews_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom-shimmer-widget.dart';
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
                                text: SaveDateInSharedPreference.getSubjectName(),
                                fontSize: 20.h,
                                bold: true,
                                alignment: AlignmentDirectional.center,
                                textColor: MainController.themeData.value.dividerColor),
                            CustomText(
                                text: "المقابلات (${controller.interviews.length})",
                                fontSize: 15.h,
                                marginTop: 8.h,
                                alignment: AlignmentDirectional.center,
                                textColor: MainController.themeData.value.dividerColor),
                          ],
                        ),
                      ],),),

                  // Expanded(
                  //   child: SingleChildScrollView(
                  //       child:  Container(
                  //           padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 15.h),
                  //           child: Column(
                  //             children: [
                  //               interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020'),
                  //               interviewItem('دورة 2020 - 2021, الفصل الثاني', context, '8','10/6/2020'),
                  //               interviewItem('دورة 2021 - 2022, الفصل الأول', context, '10', '10/6/2020'),
                  //               interviewItem('دورة 2021 -2022, الفصل الثاني', context, '15', '10/6/2020'),
                  //               interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020'),
                  //               interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020'),
                  //               interviewItem('دورة 2020 - 2021, الفصل الأول', context, '50', '10/6/2020')
                  //             ],
                  //           ))
                  //   ),
                  // ),
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
                  controller.interviews.isEmpty ?
                  Expanded(
                    child: CustomText(text: 'لم يتم إضافة مقابلات لهذه المادة بعد',
                      textColor: MainController.themeData.value.indicatorColor,
                      alignment: AlignmentDirectional.center,
                    ),
                  )
                      : Expanded(
                    child: SizedBox(
                      width: width,
                      child: ListView.builder(
                          itemCount: controller.interviews.length,
                          padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                          itemBuilder: (context, index)=>
                              // courseItem(
                              //     'دورة ${controller.courses[index].name}, ${controller.session}',
                              //     context, controller.courses[index].questionCount)
                          interviewItem('دورة ${controller.interviews[index].name}, ${controller.session}',
                           context, controller.interviews[index].questionCount)
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
  Widget interviewItem(String? title, BuildContext context, int? questionNo) {
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
              ],
            ),
             Divider(thickness: 0.8,color: MainController.themeData.value.indicatorColor.withOpacity(0.5))
          ],
        ),
      ),
    );
  }

}
