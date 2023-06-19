import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:key_app/models/FacultyYear.dart';
import 'package:key_app/services/remote_services.dart';
import 'package:http/http.dart' as http;
import 'package:key_app/ui/session_details/session_details.dart';
import 'package:key_app/utils/shared_preferance/shared_preferance.dart';

class SessionsController extends GetxController {
  final int facultyId;
  final String faculty;
  static const String baseUrl = "https://jalabdev.online/keyApp";
  final GlobalKey<ScaffoldState> sessionsKey = GlobalKey<ScaffoldState>();
  RxList<FacultyYearModel> facultyYears = RxList<FacultyYearModel>([]);
  String token = SaveDateInSharedPreference.getToken();
  RxBool isLoading = true.obs;

  SessionsController({required this.facultyId, required this.faculty});
  @override
  void onInit() {
    super.onInit();
    getDeviceId();
    fetchFacultyYears(facultyId);}

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String deviceId = '';
  void getDeviceId () async
  {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    deviceId = androidInfo.androidId;
    print('Running on ${androidInfo.androidId}');
  }

  Future<List<FacultyYearModel>> fetchFacultyYears(int id) async {
    List<dynamic> data = await getFacultyYears(id);
    facultyYears.value = data.map((json) => FacultyYearModel.fromJson(json)).toList();
    isLoading.value = false;
    return facultyYears;
  }

  Future<void> registerUser(String sessionId, String yearSession) async {
    var url = Uri.parse('$baseUrl/post/registerUser.php');
    var headers = <String, String>{
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    var response = await http.post(url, headers: headers,
      body: {
        'device_id': deviceId,
        'permission': '$facultyId$sessionId'
      }
    );

    if (response.statusCode == 200) {
      // Request succeeded
      Get.offAll(const SessionDetails(), arguments: {'yearSession': yearSession,
      'faculty': faculty
      });
      print('Request succeeded!');

    } else {
      // Request failed
      print('Request failed with status code: ${response.statusCode}');
      Get.back();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
