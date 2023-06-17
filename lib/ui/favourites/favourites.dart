import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/correct_questions/correct_questions_controller.dart';
import 'package:key_app/ui/favourites/favourites_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';
import 'package:key_app/widget/drawer.dart';

class Favourites extends GetView<FavouritesController> {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Get.put(FavouritesController());
    return Obx(()=> Scaffold(
          key: controller.favKey,
          drawer: Drawer(child: drawer()),
          body: SafeArea(
            child: Expanded(
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
                                  onTap: (){ controller.favKey.currentState!.openDrawer();},
                                  child: Icon(Ionicons.menu_sharp, color: MainController.themeData.value.dividerColor, size: 35.h,))
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
                                  text: " (0) المفضلة",
                                  fontSize: 15.h,
                                  marginTop: 8.h,
                                  alignment: AlignmentDirectional.center,
                                  textColor: MainController.themeData.value.dividerColor),
                            ],
                          ),
                        ],),),
                    const Spacer(),
                    CustomText(
                        text: 'لا توجد اسئلة في قائمة المفضلة الخاصة بك',
                        alignment: AlignmentDirectional.center,
                        fontSize: 18.h,
                        marginTop: 18.h,
                      textColor: MainController.themeData.value.indicatorColor,
                      ),
                    const Spacer()
                  ],
                ),

              ),
            ),
          )
      ),
    );
  }
}
