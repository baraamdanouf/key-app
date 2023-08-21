class ExamModel {
  ExamModel({
    required this.id,
    required this.subject,
    required this.question,
    required this.tag,
    required this.answerOne,
    required this.answerTwo,
    required this.answerThree,
    required this.answerFour,
    required this.correctAnswer,
    required this.course,
    required this.hint,
    required this.tagName
  });

  int? id;
  int? subject;
  String? question;
  String? tag;
  String? answerOne;
  String? answerTwo;
  String? answerThree;
  String? answerFour;
  int? correctAnswer;
  int? course;
  String? hint;
  String? tagName;

  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
        id: json["id"],
        subject: json["subject"],
        question: json["question"],
        tag: json["tag"],
        answerOne: json["answer_one"],
        answerTwo: json["answer_tow"],
        answerThree: json["answer_three"],
        answerFour: json["answer_four"],
        correctAnswer: json["correct_ans"],
        course: json["course"],
        hint: json["hint"],
        tagName: json["tag_name"]
    );
  }
}