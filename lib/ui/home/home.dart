import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/ui/Home/home_controler.dart';
import 'package:key_app/ui/sessions/sessions.dart';
import 'package:key_app/utils/const_colors.dart';
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
      background: primaryColor,
      textStyle: const TextStyle(color: Colors.white),
      child: Scaffold(
        key: controller.homeKey,
        drawer: Drawer(child: drawer()),
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
                       child: InkWell(
                           overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
                           onTap: (){ controller.homeKey.currentState!.openDrawer();},
                           child: Icon(Ionicons.menu_sharp, color: Colors.white, size: 35.h,))
                     ),
                     CustomText(
                         text: "الرئيسية ",
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
                            text: "الكليات",
                            fontSize: 18.h,
                            bold: true,
                            textAlign: TextAlign.center,
                            alignment: AlignmentDirectional.center,
                            textColor: Colors.black),
                      ],),),
                  SizedBox(height: 8.h,),
                  facultyItem('كلية الطب البشري', context) ,
                  facultyItem('كلية العلوم', context)
                ],
              ),
            ),
    )),
    );
  }
  Widget facultyItem(String? faculty , BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){Get.to(const Sessions());},
      child: SizedBox(
          width: width,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 18.w, end: 18.w, top: 12.h, bottom: 12.h),
                    child: Icon(Ionicons.business_outline, color: secondaryColor,
                        size: 30.h)),
                  CustomText(
                      text: "$faculty - جامعة حلب",
                      fontSize: 18.h,
                      bold: true,
                      alignment: AlignmentDirectional.center,
                      textColor:Colors.black),
                ],
              ),
              const Divider(thickness: 0.8,color: textColor)
            ],
          ),
        ),
    );
  }

}
