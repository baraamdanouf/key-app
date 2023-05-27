import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:device_info_plus/device_info_plus.dart';

class LoginController extends GetxController {
  final GlobalKey<ScaffoldState> loginKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCode = TextEditingController();

  var isPasswordHidden = true.obs;
  final isChecked = false.obs;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  void getData () async
  {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.androidId}');
  }

  @override
  void onInit() async{
    super.onInit();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerCode.dispose();
  }
}
