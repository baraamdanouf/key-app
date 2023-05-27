import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/ui/course_details/course_setails_controller.dart';
import 'package:key_app/ui/main_page/main_page.dart';
import 'package:key_app/ui/main_page/main_page_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';

class CourseDetails extends GetView<CourseDetailsController> {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(CourseDetailsController());
    return  Scaffold(
      key: controller.courseDetailsKey,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                                text: "أطفال 1",
                                fontSize: 20.h,
                                bold: true,
                                alignment: AlignmentDirectional.center,
                                textColor: Colors.white),
                            CustomText(
                                text: "السنة الخامسة - الفصل الأول",
                                fontSize: 15.h,
                                marginTop: 8.h,
                                alignment: AlignmentDirectional.center,
                                textColor: Colors.white),
                          ],
                        ),
                      ],),),
                  SizedBox(height: 15.h,),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        courseItem('الدورات', Ionicons.document_outline,context, (){
                          Get.to(const MainPage());
                          MainPageController.selectedIndex.value = 0;
                         MainPageController.pageController.jumpToPage(0);
                        }),
                        courseItem('البنوك', Ionicons.briefcase_outline,context, (){
                          Get.to(const MainPage());
                          MainPageController.selectedIndex.value = 1;
                          MainPageController.pageController.jumpToPage(1);
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        courseItem('المقابلات', Ionicons.receipt_outline,context, (){
                          Get.to(const MainPage());
                          MainPageController.selectedIndex.value = 3;
                          MainPageController.pageController.jumpToPage(3);
                        }),
                        courseItem('التصنيفات', Ionicons.pricetags_outline,context, (){
                          Get.to(const MainPage());
                          MainPageController.selectedIndex.value = 2;
                          MainPageController.pageController.jumpToPage(2);
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        courseItem('بحث', Ionicons.search_outline, context, (){}),
                        courseItem('المفضلة', Ionicons.heart_outline,context, (){
                          print('gg');
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Container(
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        courseItem('الصحيحات', Ionicons.checkbox_outline,context, (){print('gg');}),
                        courseItem('حول المادة', Ionicons.information_circle_outline,context, (){print('gg');}),
                      ],
                    ),
                  ),
                ],
              ),
    )),
    );
  }
  Widget courseItem(String? title, IconData? iconData , BuildContext context, Callback? press) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: press,
      child: Container(
        width: width/2 - 25.w,
        decoration: BoxDecoration(
          color: greyLite,
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
        height: 160.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Icon(iconData, size: 50.h,color: primaryColor),
            CustomText(
                text: "$title",
                fontSize: 18.h,
                marginTop: 5.h,
                marginBottom: 5.h,
                alignment: AlignmentDirectional.center,
                textColor: textColor),
          ],
        ),
      ),
    );
  }

}
