import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/faculty_model.dart';
import 'package:key_app/services/remote_services.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

  RxList<FacultyModel> faculties = RxList<FacultyModel>([]);
  RxBool isLoading = true.obs;
  @override
  void onInit() async{
    super.onInit();
    await fetchFaculties();
  }
  Future<List<FacultyModel>> fetchFaculties() async {
    List<dynamic> data = await getFaculties();
    faculties.value = data.map((json) => FacultyModel.fromJson(json)).toList();
    isLoading.value = false;
    return faculties;
  }
  @override
  void dispose() {
    super.dispose();
  }
}
