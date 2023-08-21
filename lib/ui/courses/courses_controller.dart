import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/course_model.dart';
import 'package:key_app/services/remote_services.dart';

class CoursesController extends GetxController {
  final GlobalKey<ScaffoldState> coursesKey = GlobalKey<ScaffoldState>();

  RxList<CourseModel> courses = RxList<CourseModel>([]);
  RxBool isLoading = true.obs;
  String session = '';

  @override
  void onInit() async{
    super.onInit();
    await fetchCourses();
  }

  Future<List<CourseModel>> fetchCourses() async {
    List<dynamic> data = await getCourses(1);
    courses.value = data.map((json) => CourseModel.fromJson(json)).toList();
    isLoading.value = false;
    for(var item in courses)
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
    return courses;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
