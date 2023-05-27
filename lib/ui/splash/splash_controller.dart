import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Create splash controller and inherit from getx state management
class SplashController extends GetxController {
  //Define unique key to splash scaffold
  final GlobalKey<ScaffoldState> splashKey = GlobalKey<ScaffoldState>();

  //Execute instructions after initializing the page.
  @override
  void onInit() {
    super.onInit();
  }

  //dispose this page and some instructions.
  @override
  void dispose() {
    super.dispose();
  }
}
