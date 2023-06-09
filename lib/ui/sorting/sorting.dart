import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/sort_questions/sort_questions.dart';
import 'package:key_app/ui/sorting/sorting_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class Sorting extends GetView<SortingController> {
  const Sorting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(SortingController());
    return Obx(()=> Scaffold(
        key: controller.sortingKey,
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
                                  onTap: (){ controller.sortingKey.currentState!.openDrawer();},
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
                                    text: "التصنيفات (8)",
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
                                    sortItem('اللقاحات', context, '50', '10'),
                                    sortItem('اللقاحات', context, '50', '10'),
                                    sortItem('اللقاحات', context, '50', '10'),
                                    sortItem('اللقاحات', context, '50', '10'),
                                    sortItem('اللقاحات', context, '50', '10'),
                                    sortItem('اللقاحات', context, '50', '10'),
                                    sortItem('اللقاحات', context, '50', '10'),
                                    sortItem('اللقاحات', context, '50', '10')
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
  Widget sortItem(String? title, BuildContext context, String? questionNo, String? bankNo) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      overlayColor:MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: (){Get.to(const SortQuestions());},
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child:  Icon(Ionicons.pricetags_outline, size: 30.h,
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
                          text: 'عدد أسئلة الدورات :',
                          fontSize: 15.h,
                          textColor: MainController.themeData.value.indicatorColor),
                      CustomText(
                          text: '$questionNo',
                          fontSize: 15.h,
                          textColor: MainController.themeData.value.indicatorColor),
                      CustomText(
                          text: 'عدد أسئلة البنوك :',
                          fontSize: 15.h,
                          marginStart: 8.h,
                          textColor: MainController.themeData.value.indicatorColor),
                      CustomText(
                          text: '$bankNo',
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
            const Divider(thickness: 0.8,color: textColor)
          ],
        ),
      ),
    );
  }

}
