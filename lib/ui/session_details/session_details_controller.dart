import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/subject_model.dart';
import 'package:key_app/services/remote_services.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';

class SessionDetailsController extends GetxController {
  final GlobalKey<ScaffoldState> sessionDetailsKey = GlobalKey<ScaffoldState>();

  RxList<SubjectModel> facultyYears = RxList<SubjectModel>([]);
  RxBool isLoading = true.obs;

  @override
  void onInit() async{
    super.onInit();
    //set your device id
    await fetchUserSubjects('106b633aa6fc3a2f');
  }

  Future<List<SubjectModel>> fetchUserSubjects(String deviceId) async {
    List<dynamic> data = await getUserSubjects(deviceId);
    facultyYears.value = data.map((json) => SubjectModel.fromJson(json)).toList();
    isLoading.value = false;
    return facultyYears;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
