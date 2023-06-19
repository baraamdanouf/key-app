import 'package:http/http.dart' as http;
import 'dart:convert';

const url = "http://jalabdev.online/keyApp";
const String apiUrlGetFaculties = "$url/get/getFaculties.php";
const String apiUrlGetFacultyYears = "$url/get/getFacultyYears.php";

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
