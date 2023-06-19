import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/course_details/course_details.dart';
import 'package:key_app/ui/session_details/session_details_controller.dart';
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
                                        text: "${Get.arguments['yearSession']}",
                                        fontSize: 20.h,
                                        bold: true,
                                        alignment: AlignmentDirectional.center,
                                        textColor: MainController.themeData.value.dividerColor),
                                    CustomText(
                                        text: "كلية ${Get.arguments['faculty']} - جامعة حلب",
                                        fontSize: 15.h,
                                        marginTop: 8.h,
                                        alignment: AlignmentDirectional.center,
                                        textColor: MainController.themeData.value.dividerColor),
                                  ],
                                ),
                              ],),),
                          SizedBox(height: 8.h,),
                          courseItem('أطفال 1','10/6/2020', context) ,
                          courseItem('أمراض العين وجراحتها','10/6/2020', context),
                          courseItem('الأمراض النسائية','10/6/2020', context) ,
                          courseItem('الطب الوقائي','10/6/2020', context),
                          courseItem('جراحة عصبية وبولية','10/6/2020', context) ,
                          courseItem('داخلية عصبية','10/6/2020', context)

                        ],
                      ),
                    ),
                  ),
            ),
      ),
    );
  }
  Widget courseItem(String? course, String? date , BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){Get.to(const CourseDetails());},
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
                            text: '9',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: MainController.themeData.value.indicatorColor),
                        Icon(Ionicons.briefcase_outline, color: MainController.themeData.value.hintColor, size: 18.h,),
                        CustomText(
                            text: '14',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: MainController.themeData.value.indicatorColor),
                        Icon(Ionicons.newspaper_outline, color: MainController.themeData.value.hintColor, size: 18.h,),
                        CustomText(
                            text: '14',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: MainController.themeData.value.indicatorColor),
                      ],)
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
