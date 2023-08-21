class CourseModel {
  CourseModel({
    required this.id,
    required this.name,
    required this.subject,
    required this.type,
    required this.questionCount
  });

  int id;
  String name;
  int subject;
  int? type;
  int? questionCount;

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json["course_id"],
      name: json["course_name"]?.toString() ?? '',
      subject: json["subject"],
      type: json["type"],
      questionCount: json["question_count"]
    );
  }
}