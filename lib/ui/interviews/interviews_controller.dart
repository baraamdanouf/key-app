import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/course_model.dart';
import 'package:key_app/services/remote_services.dart';

class InterviewsController extends GetxController {
  final GlobalKey<ScaffoldState> interviewsKey = GlobalKey<ScaffoldState>();

  RxList<CourseModel> interviews = RxList<CourseModel>([]);
  RxBool isLoading = true.obs;
  String session = '';
  @override
  void onInit() {
    super.onInit();
    fetchCourses();
  }

  Future<List<CourseModel>> fetchCourses() async {
    List<dynamic> data = await getCourses(3);
    interviews.value = data.map((json) => CourseModel.fromJson(json)).toList();
    isLoading.value = false;
    for(var item in interviews)
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
    return interviews;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
