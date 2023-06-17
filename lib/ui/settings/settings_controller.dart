import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final GlobalKey<ScaffoldState> settingsKey = GlobalKey<ScaffoldState>();

  RxBool isEnabled = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
