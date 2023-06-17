import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/session_details/session_details.dart';
import 'package:key_app/ui/sessions/session_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom-shimmer-widget.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class Sessions extends GetView<SessionsController> {
  final int facultyId;
  const Sessions({Key? key, required this.facultyId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(SessionsController(facultyId: facultyId));
    return Scaffold(
          key: controller.sessionsKey,
          drawer: Drawer(child: drawer()),
          body: Obx(()=> SafeArea(
              child: SizedBox(
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
                              child: InkWell(child: Icon(Ionicons.menu_sharp, color: MainController.themeData.value.dividerColor, size: 35.h),
                                onTap: (){ controller.sessionsKey.currentState!.openDrawer();},
                              )
                          ),
                          CustomText(
                              text: 'كلية ${Get.arguments['faculty']}',
                              fontSize: 20.h,
                              bold: true,
                              alignment: AlignmentDirectional.center,
                              textColor: MainController.themeData.value.dividerColor),
                        ],),),
                    Container(width: width, height: 66.h,color: MainController.themeData.value.dividerColor,
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
                                  color: MainController.themeData.value.dividerColor,
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
                    )
                    : Expanded(
                      child: SizedBox(
                        width: width,
                        child: ListView.builder(
                            itemCount: controller.facultyYears.length,
                            padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                            itemBuilder: (context, index)=>
                        sessionItem(controller.facultyYears[index], 'كلية ${Get.arguments['faculty']}', '7','10/6/2020', context)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
  Widget sessionItem(String? yearSession,String? faculty ,
      String? courseNo,String? date , BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){Get.to(const SessionDetails());},
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Icon(Ionicons.school_outline,
                      color: MainController.themeData.value.hintColor, size: 46.h)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: '$yearSession',
                        fontSize: 18.h,
                        bold: true,
                        marginBottom: 8.h,
                        marginTop: 8.h,
                        textColor: MainController.themeData.value.indicatorColor),
                    CustomText(
                        text: "$faculty - جامعة حلب",
                        fontSize: 15.h,
                        marginBottom: 8.h,
                        textColor:MainController.themeData.value.indicatorColor),
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
