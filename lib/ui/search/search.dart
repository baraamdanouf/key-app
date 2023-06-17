import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/search/search_controller.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';
import 'package:key_app/widget/custom_text.dart';

class Search extends GetView<SearchController> {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Get.put(SearchController());
    return Obx(()=> Scaffold(
      key: controller.searchKey,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 88.h,
          backgroundColor: MainController.themeData.value.primaryColor,
          elevation: 2,
          iconTheme: IconThemeData(color: MainController.themeData.value.dividerColor),
          actions: [
            Container(
              width: width - 50.w,
              height: 60.h,
              alignment: Alignment.center,
              child: Row(
                children:[ ConstrainedBox(
                    constraints:
                    BoxConstraints.tightFor(width: width - 70.w, height: 50.h,),
                    child: TextField(
                        controller: controller.controllerSearch,
                        onSubmitted: (f) {
                          if (controller.controllerSearch.value.text != "") {
                            controller.searchList.add(controller.controllerSearch.value.text);
                            SaveDateInSharedPreference.setSearches(controller.searchList);
                          }
                          print(controller.searchList);
                        },
                        style: TextStyle(fontSize: 15.h, color: textColor),
                        decoration: InputDecoration(
                          fillColor: MainController.themeData.value.dividerColor,
                          filled: true,
                          disabledBorder: OutlineInputBorder(
                              borderSide:  BorderSide(color: MainController.themeData.value.dividerColor),
                              borderRadius: BorderRadius.circular(30.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:  BorderSide(color: MainController.themeData.value.dividerColor),
                              borderRadius: BorderRadius.circular(30.r)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: MainController.themeData.value.dividerColor),
                              borderRadius: BorderRadius.circular(30.r)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: MainController.themeData.value.dividerColor),
                              borderRadius: BorderRadius.circular(30.r)),
                          hintText: "بحث",
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(color: grey, fontSize: 16.h),
                          prefixIcon: IconButton(
                            icon: Icon(
                              Ionicons.search_outline,
                              size: 20.h,
                              color: MainController.themeData.value.primaryColor
                            ),
                            onPressed: () {},
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                Ionicons.close_outline,
                                size: 18.h,
                              color: MainController.themeData.value.primaryColor,
                              ),
                              onPressed: () {
                                controller.controllerSearch.clear();
                              }
                        ),
                      ),
                    ),
                ),
                  Spacer()
              ]),
              )],
        ),
        //Using to inserts its child with sufficient padding to avoid intrusions by the operating system.
        body: SafeArea(
            child: Obx(() =>
            //Observable Container is a widget that can contain multiple child widgets and manage them efficiently through width, height, padding, background color, etc.
            Container(
            width: width,
            height: height,
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
            //if list empty show text, else put in one row search text and close icon.
            child: controller.searchList.value.isEmpty
                ?  CustomText(
                    text: "ليس لديك بحوث مؤخرًا",
                    alignment: AlignmentDirectional.center,
                    textColor: MainController.themeData.value.indicatorColor,
                  )
                : Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: "البحوث الأخيرة",
                              alignment: AlignmentDirectional.center,
                              textColor: MainController.themeData.value.indicatorColor,
                              bold: true,
                              fontSize: 16.h,
                            ),
                            CustomText(
                              text: "حذف الكل",
                              alignment: AlignmentDirectional.center,
                              textColor: yellow,
                              bold: true,
                              fontSize: 14.h,
                              onPressed: () {
                                controller.searchList.value.clear();
                                controller.searchList.refresh();
                                SaveDateInSharedPreference.deleteAllSearches();
                              },
                            ),
                          ]),
                      SizedBox(height: 10.h),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20.w),
                        child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.searchList.value.length,
                                itemBuilder: (context, index) => Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              text: controller
                                                  .searchList.value[index]
                                                  .toString(),
                                              textColor: MainController.themeData.value.indicatorColor,
                                              fontSize: 15.h,
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.all(8),
                                              onPressed: () {
                                                controller.searchList.value.removeAt(index);
                                                SaveDateInSharedPreference.setSearches( controller.searchList.value);
                                                controller.searchList.refresh();
                                              },
                                              icon: Icon(Ionicons.close_outline, size: 14.h,
                                              color: MainController.themeData.value.indicatorColor
                                              )
                                            )
                                          ],
                                        ),
                                        // SizedBox(
                                        //   height: 10.h,
                                        // )
                                      ],
                                    )),
                      ),
                    ],
                  ),
          ),
        )),
      ),
    );
  }
}
