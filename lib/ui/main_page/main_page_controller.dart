import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPageController extends GetxController {
  final GlobalKey<ScaffoldState> mainPageKey = GlobalKey<ScaffoldState>();
  static var selectedIndex = 0.obs;
  static PageController pageController = PageController();

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex.value);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
