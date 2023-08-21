import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/sort_questions/sort_questions.dart';
import 'package:key_app/ui/sorting/sorting_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom-shimmer-widget.dart';
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
                                    text: SaveDateInSharedPreference.getSubjectName(),
                                    fontSize: 20.h,
                                    bold: true,
                                    alignment: AlignmentDirectional.center,
                                    textColor: MainController.themeData.value.dividerColor),
                                CustomText(
                                    text: "التصنيفات (${controller.tags.length})",
                                    fontSize: 15.h,
                                    marginTop: 8.h,
                                    alignment: AlignmentDirectional.center,
                                    textColor: MainController.themeData.value.dividerColor),
                              ],
                            ),
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
                      ):
                      controller.tags.isEmpty ?
                      Expanded(
                        child: CustomText(text: 'لم يتم إضافة تصنيفات لهذه المادة بعد',
                          textColor: MainController.themeData.value.indicatorColor,
                          alignment: AlignmentDirectional.center,
                        ),
                      )
                          : Expanded(
                        child: SizedBox(
                          width: width,
                          child: ListView.builder(
                              itemCount: controller.tags.length,
                              padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
                              itemBuilder: (context, index)=>
                                  tagItem(
                                      controller.tags[index].name,
                                      context, controller.tags[index].name, 'jjj')
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
  Widget tagItem(String? title, BuildContext context, String? questionNo, String? bankNo) {
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
                    // Row(children: [
                    //   CustomText(
                    //       text: 'عدد أسئلة الدورات :',
                    //       fontSize: 15.h,
                    //       textColor: MainController.themeData.value.indicatorColor),
                    //   CustomText(
                    //       text: '$questionNo',
                    //       fontSize: 15.h,
                    //       textColor: MainController.themeData.value.indicatorColor),
                    //   CustomText(
                    //       text: 'عدد أسئلة البنوك :',
                    //       fontSize: 15.h,
                    //       marginStart: 8.h,
                    //       textColor: MainController.themeData.value.indicatorColor),
                    //   CustomText(
                    //       text: '$bankNo',
                    //       fontSize: 15.h,
                    //       textColor: MainController.themeData.value.indicatorColor),
                    // ],)
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
