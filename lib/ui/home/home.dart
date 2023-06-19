import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/Home/home_controler.dart';
import 'package:key_app/ui/sessions/sessions.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom-shimmer-widget.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(HomeController());
    return DoubleBack(
      message: "من فضلك, اضغط زر الرجوع مرة أخرى لإغلاق التطبيق",
      background: MainController.themeData.value.primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: Scaffold(
        key: controller.homeKey,
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
                         child: InkWell(
                             overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
                             onTap: (){ controller.homeKey.currentState!.openDrawer();},
                             child: Icon(Ionicons.menu_sharp, color: MainController.themeData.value.dividerColor, size: 35.h,))
                       ),
                       CustomText(
                           text: "الرئيسية ",
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
                              decoration: BoxDecoration(
                                  color: MainController.themeData.value.primaryColor,
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
                              text: "الكليات",
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
                            itemCount: controller.faculties.length,
                            padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                            itemBuilder: (context, index)=>
                                facultyItem(controller.faculties[index].name, context, controller.faculties[index].id)),
                      ),
                    )
                  ],
                ),
              ),
             ),
        )),
    );
  }
  Widget facultyItem(String? faculty , BuildContext context, int id) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){Get.to(Sessions(facultyId: id, faculty: faculty!),arguments: {'faculty': faculty});},
      child: SizedBox(
          width: width,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 12.h, bottom: 12.h),
                    child: Icon(Ionicons.business_outline, color: MainController.themeData.value.hintColor,
                        size: 30.h)),
                  CustomText(
                      text: "$faculty - جامعة حلب",
                      fontSize: 18.h,
                      bold: true,
                      alignment: AlignmentDirectional.center,
                      textColor: MainController.themeData.value.indicatorColor),
                ],
              ),
               Divider(thickness: 0.8,color: MainController.themeData.value.indicatorColor.withOpacity(0.5))
            ],
          ),
        ),
    );
  }

}
