import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/ui/session_details/session_details.dart';
import 'package:key_app/ui/sessions/session_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';

class Sessions extends GetView<SessionsController> {
  const Sessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(SessionsController());
    return Scaffold(
          key: controller.sessionsKey,
          body: SafeArea(
            child: SizedBox(
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
                            child: Icon(Ionicons.menu_sharp, color: Colors.white, size: 35.h,)
                        ),
                        CustomText(
                            text: "كلية الطب البشري",
                            fontSize: 20.h,
                            bold: true,
                            alignment: AlignmentDirectional.center,
                            textColor: Colors.white),
                      ],),),
                  Container(width: width, height: 66.h,color: greyLite,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14.w),
                          child: Container(
                            width: 44.w,
                            height: 44.h,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Ionicons.bookmark_outline,
                                color: Colors.white,
                                size: 25.h,
                              ),
                            ),
                          ),
                        ),
                        CustomText(
                            text: "الفصول ",
                            fontSize: 18.h,
                            bold: true,
                            textAlign: TextAlign.center,
                            alignment: AlignmentDirectional.center,
                            textColor: Colors.black),
                      ],),),
                  SizedBox(height: 8.h,),
                  sessionItem('الفصل الأول', 'السنة الخامسة','كلية الطب البشري', '7','10/6/2020', context) ,
                  sessionItem('الفصل الأول', 'السنة الأولى','كلية العلوم', '6','10/6/2020', context)
                ],
              ),
            ),
          ),
    );
  }
  Widget sessionItem(String? session, String? year,String? faculty ,
      String? courseNo,String? date , BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){Get.to(const SessionDetails());},
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Icon(Ionicons.school_outline, color: secondaryColor, size: 46.h)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: '$year - $session',
                        fontSize: 18.h,
                        bold: true,
                        marginBottom: 8.h,
                        marginTop: 8.h,
                        textColor: Colors.black),
                    CustomText(
                        text: "$faculty - جامعة حلب",
                        fontSize: 15.h,
                        marginBottom: 8.h,
                        textColor:textColor),
                    CustomText(
                        text: "عدد المواد : $courseNo",
                        fontSize: 15.h,
                        textColor: textColor),
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
