class SubjectModel {
  SubjectModel({
    this.success,
    this.data,
  });

  bool? success;
  List<Subject>? data;

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      SubjectModel(
        success: json["success"],
        // data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        data: (json['data'] as List<dynamic>)
            .map((e) => Subject.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Subject {
  Subject({
    this.subjectId,
    this.name,
    this.year,
    this.semester,
    this.description,
    this.faculty,
    this.courseData,
  });

  int? subjectId;
  String? name;
  int? year;
  int? semester;
  String? description;
  int? faculty;
  String? courseData;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    subjectId: json["subject_id"],
    name: json["name"],
    year: json["year"],
    semester: json["semester"],
    description: json["description"],
    courseData: json["course_data"]
    // (jsonDecode(json['course_data']) as List<dynamic>)
    //     .map((e) => CourseData.fromJson(e as Map<String, dynamic>))
    //     .toList(),
  );
}

class CourseData {
  CourseData({
    this.type,
    this.courseCount,
  });

  int? type;
  int? courseCount;

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
    type : json["type"],
    courseCount: json["course_count"],
  );
}