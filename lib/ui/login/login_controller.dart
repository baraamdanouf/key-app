import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:key_app/ui/home/home.dart';

class LoginController extends GetxController {
  final GlobalKey<ScaffoldState> loginKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCode = TextEditingController();

  final String apiUrlCheckUser = "https://jalabdev.online/keyApp/post/checkCode.php";
  var isPasswordHidden = true.obs;
  final isChecked = false.obs;

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  void getData () async
  {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.androidId}');
  }

  Future<void> performPostRequest(String userId) async {
    var url = Uri.parse('https://jalabdev.online/keyApp/post/checkCode.php');

    var headers = <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var body = <String, dynamic>{
      'user_id': userId,
    };

    var response = await http.post(url, headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      // Request succeeded
      Get.offAll(const Home());
      print('Request succeeded!');

    } else {
      // Request failed
      print('Request failed with status code: ${response.statusCode}');
    }
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
