import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/subject_model.dart';
import 'package:key_app/services/remote_services.dart';

class SessionDetailsController extends GetxController {
  final GlobalKey<ScaffoldState> sessionDetailsKey = GlobalKey<ScaffoldState>();

  RxList<Subject> subjects = RxList<Subject>([]);
  int? courseCount = 0;
  int? bankCount = 0;
  int? interviewCount = 0;
  RxBool isLoading = true.obs;

  @override
  void onInit() async{
    super.onInit();
    await fetchUserSubjects();
  }

  Future<List<Subject>> fetchUserSubjects() async {
    List<dynamic> data = await getUserSubjects();
    subjects.value = data.map((json) => Subject.fromJson(json)).toList();
    isLoading.value = false;

    for (var element in subjects) {
      for(var item in element.courseData!)
        {
          if(item.type == 1)
            {
              courseCount = item.courseCount;
            }
          else if(item.type == 2)
            {
              bankCount = item.courseCount;
            }
          else if(item.type == 3)
            {
              interviewCount = item.courseCount;
            }
        }
    }
    return subjects;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
