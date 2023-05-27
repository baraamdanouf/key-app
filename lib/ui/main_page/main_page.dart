import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:key_app/ui/courses/courses.dart';
import 'package:key_app/ui/main_page/main_page_controller.dart';
import 'package:key_app/ui/sorting/sorting.dart';
import 'package:key_app/utils/const_colors.dart';


class MainPage extends GetView<MainPageController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const screens = [
      Courses(),
      Center(child: Text('h3'),),
      Sorting(),
      Center(child: Text('h4'),),
    ];

    Get.put(MainPageController());
    return  Scaffold(
          key: controller.mainPageKey,
          bottomNavigationBar: Obx(()=>
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child:
              BottomNavigationBar(
                  backgroundColor:greyLite,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: primaryColor,
                  unselectedItemColor: textColor,
                  showUnselectedLabels: false,
                  elevation: 25,
                  selectedLabelStyle: TextStyle(color: Colors.red,fontSize: 14.h, fontWeight: FontWeight.w600),
                  iconSize: 30.h,
                  currentIndex: MainPageController.selectedIndex.value,
                  onTap: (index)=> MainPageController.selectedIndex.value = index,
                  items: const [
                    BottomNavigationBarItem(icon:Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Icon(Ionicons.document_outline),
                   ), label: 'الدورات', ),
                   BottomNavigationBarItem(icon:Icon(Ionicons.briefcase_outline), label: 'البنوك'),
                   BottomNavigationBarItem(icon:Icon(Ionicons.pricetags_outline), label:'التصنيفات'),
                  BottomNavigationBarItem(icon:Icon(Ionicons.receipt_outline),
                      label: 'المقابلات',
                  )],
            ),
                ),
              ),
          body: Obx(()=> screens[MainPageController.selectedIndex.value])
    );
  }
}