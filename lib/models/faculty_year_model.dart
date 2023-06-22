class FacultyYearModel {
  FacultyYearModel({
    required this.id,
    required this.name,
  });

  String id;
  String name;


  factory FacultyYearModel.fromJson(Map<String, dynamic> json) {
    return FacultyYearModel(
      id: json["id"].toString() ?? '',
      name: json["name"]?.toString() ?? '',
    );
  }
}