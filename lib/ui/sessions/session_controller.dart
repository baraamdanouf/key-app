import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/services/remote_services.dart';

class SessionsController extends GetxController {
  final int facultyId;
  final GlobalKey<ScaffoldState> sessionsKey = GlobalKey<ScaffoldState>();
  RxList<dynamic> facultyYears = RxList<String>([]);
  RxBool isLoading = true.obs;

  SessionsController({required this.facultyId});
  @override
  void onInit() {
    super.onInit();
    fetchFacultyYears(facultyId);}

  Future<List<dynamic>> fetchFacultyYears(int id) async {
    List<dynamic> data = await getFacultyYears(id);
    facultyYears = data.obs;
    isLoading.value = false;
    return facultyYears;
  }
  @override
  void dispose() {
    super.dispose();
  }
}
