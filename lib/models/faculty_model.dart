class FacultyModel {
  FacultyModel({
    required this.id,
    required this.name,
    required this.numOfYears
  });

  int id;
  String name;
  int numOfYears;


  factory FacultyModel.fromJson(Map<String, dynamic> json) {
    return FacultyModel(
      id: json["faculty_id"],
      name: json["faculty_name"]?.toString() ?? '',
      numOfYears: json["numOfYears"],
    );
  }
}