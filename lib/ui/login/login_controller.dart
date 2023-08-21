import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:key_app/main_controller.dart';
import 'package:key_app/ui/home/home.dart';
import 'package:key_app/utils/const_colors.dart';
import 'package:key_app/widget/custom_text.dart';

class LoginController extends GetxController {
  final GlobalKey<ScaffoldState> loginKey = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerCode = TextEditingController();

  static const String baseUrl = "https://jalabdev.online/keyApp";
  var isPasswordHidden = true.obs;
  final isChecked = false.obs;


  Future<void> checkCode(String userId) async {
    var url = Uri.parse('$baseUrl/post/checkCode.php');
    final snackBar = SnackBar(
      backgroundColor: secondaryColor,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(label: 'إخفاء',
        textColor: yellow,
        onPressed: () {},),
      content: CustomText(
          text: 'الكود خاطىء' ,
          fontSize: 18.h,
          fontFamily: 'Almarai',
          textColor: MainController.themeData.value.dividerColor),

    );
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
     // print('Request succeeded!');

    } else {
      // Request failed
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
     // print('Request failed with status code: ${response.statusCode}');
    }
  }

  @override
  void onInit() async{
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerCode.dispose();
  }
}
