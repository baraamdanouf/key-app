import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/ui/course_details/course_details.dart';
import 'package:key_app/ui/session_details/session_details_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';

class SessionDetails extends GetView<SessionDetailsController> {
  const SessionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(SessionDetailsController());
    return  Scaffold(
          key: controller.sessionDetailsKey,
          body: SafeArea(
              child:SizedBox(
                  width: width,
                  height : height,
                  child: Column(
                    children: [
                      Container(
                        width: width, height: 85.h,color: primaryColor,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 12.w, left: 18.w),
                              child: Icon(Ionicons.menu_sharp, color: Colors.white, size: 35.h,),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    text: "السنة الخامسة - الفصل الأول",
                                    fontSize: 20.h,
                                    bold: true,
                                    //   textAlign: TextAlign.center,
                                    alignment: AlignmentDirectional.center,
                                    textColor: Colors.white),
                                CustomText(
                                    text: "كلية الطب البشري - جامعة حلب",
                                    fontSize: 15.h,
                                    marginTop: 8.h,
                                    //   textAlign: TextAlign.center,
                                    alignment: AlignmentDirectional.center,
                                    textColor: Colors.white),
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
    );
  }
  Widget courseItem(String? course, String? date , BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
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
                    // child:
                    // Container(
                    //   width: 60.w,
                    //   height: 60.h,
                    //   decoration: const BoxDecoration(
                    //     color: primaryColor,
                    //     shape: BoxShape.circle,
                    //   ),
                      child:
                      Center(
                        child: Icon(Ionicons.library_outline, color: secondaryColor, size: 35.h,)
                      ),
                    ),
               //   ),
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
                          textColor: Colors.black),
                      Row(children: [
                        Icon(Ionicons.document_outline, color: textColor, size: 18.h,),
                        CustomText(
                            text: '9',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: textColor),
                        Icon(Ionicons.briefcase_outline, color: textColor, size: 18.h,),
                        CustomText(
                            text: '14',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: textColor),
                        Icon(Ionicons.receipt_outline, color: textColor, size: 18.h,),
                        CustomText(
                            text: '14',
                            fontSize: 15.h,
                            marginEnd: 8.h,
                            marginStart: 8.h,
                            textColor: textColor),
                      ],)
                    ],),
                  const Spacer(),
                  Align(
                    child: CustomText(
                        text: "$date",
                        fontSize: 18.h,
                        marginEnd: 12.w,
                        textColor: textColor),
                  ),
                ],
              ),
              const Divider(thickness: 0.8,color: textColor)
            ],
          ),
        ),
    );
  }

}
