import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/course_model.dart';
import 'package:key_app/services/remote_services.dart';

class BanksController extends GetxController {
  final GlobalKey<ScaffoldState> banksKey = GlobalKey<ScaffoldState>();

  RxList<CourseModel> banks = RxList<CourseModel>([]);
  RxBool isLoading = true.obs;
  String session = '';

  @override
  void onInit() async{
    super.onInit();
    await fetchCourses();
  }

  Future<List<CourseModel>> fetchCourses() async {
    List<dynamic> data = await getCourses(2);
    banks.value = data.map((json) => CourseModel.fromJson(json)).toList();
    isLoading.value = false;
    for(var item in banks)
    {
      if(item.subject == 1)
      {
        session = 'الفصل الأول';
      }
      else if(item.subject == 2)
      {
        session = 'الفصل الثاني';
      }
    }
    return banks;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
