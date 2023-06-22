import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:key_app/utils/shared_preferance/shared_preferance.dart';

const url = "http://jalabdev.online/keyApp";
const String apiUrlGetFaculties = "$url/get/getFaculties.php";
const String apiUrlGetFacultyYears = "$url/get/getFacultyYears.php";
const String apiUrlGetUserSubjects = "$url/get/getUserSubjects.php";
String token = SaveDateInSharedPreference.getToken();

Future<List<dynamic>> getFaculties() async {
  var response = await http.get(Uri.parse(apiUrlGetFaculties));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    List<dynamic> data = json.decode(response.body);
    return data;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data from API');
  }
}

Future<List<dynamic>> getFacultyYears(int id) async {
  var queryParams = {'id': id.toString()};
  var uri = Uri.parse(apiUrlGetFacultyYears).replace(queryParameters: queryParams);

  var response = await http.get(uri);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    print(data);
    return data;
  } else {
    throw Exception('Failed to load data from API');
  }
}

Future<List<dynamic>> getUserSubjects(String deviceId) async {
  var queryParams = {'device_id': deviceId};
  var uri = Uri.parse(apiUrlGetUserSubjects).replace(queryParameters: queryParams);
  var headers = <String, String>{
    'Authorization': 'Bearer $token',
   // 'Content-Type': 'application/x-www-form-urlencoded',
  };
  var response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    print(data);
    return data;
  } else {
    print(response.statusCode);
    throw Exception('Failed to load data from API');
  }
}