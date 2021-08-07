import 'package:interview_task/app/model_test/domain/entities/model_test_result_entity.dart';

class ModelTestResultModel extends ModelTestResultEntity {

  final int id;
  final String studentFullName;
  final String studentId;
  final int modelTest;
  final int totalQuestionAttended;
  final int totalRightAnswer;
  final int totalWrongAnswer;
  final double totalNegativeMarks;
  final double totalMarks;
  final int? duration;
  final String passFail;

    ModelTestResultModel({
      required this.id,
      required this.studentFullName,
      required this.studentId,
      required this.modelTest,
      required this.totalQuestionAttended,
      required this.totalRightAnswer,
      required this.totalWrongAnswer,
      required this.totalNegativeMarks,
      required this.totalMarks,
      this.duration,
      required this.passFail,
    }) : super(
      id: id,
      studentFullName: studentFullName,
      studentId: studentId,
      modelTest: modelTest,
      totalQuestionAttended: totalQuestionAttended,
      totalRightAnswer: totalRightAnswer,
      totalWrongAnswer: totalWrongAnswer,
      totalNegativeMarks: totalNegativeMarks,
      totalMarks: totalMarks,
      duration: duration,
      passFail: passFail,
    );

    factory ModelTestResultModel.fromJson(Map<String, dynamic> json) => ModelTestResultModel(
        id: json["id"],
        studentFullName: json["student_full_name"],
        studentId: json["student_id"],
        modelTest: json["model_test"],
        totalQuestionAttended: json["total_question_attended"],
        totalRightAnswer: json["total_right_answer"],
        totalWrongAnswer: json["total_wrong_answer"],
        totalNegativeMarks: json["total_negative_marks"].toDouble(),
        totalMarks: json["total_marks"].toDouble(),
        duration: json["duration"],
        passFail: json["pass_fail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student_full_name": studentFullName,
        "student_id": studentId,
        "model_test": modelTest,
        "total_question_attended": totalQuestionAttended,
        "total_right_answer": totalRightAnswer,
        "total_wrong_answer": totalWrongAnswer,
        "total_negative_marks": totalNegativeMarks,
        "total_marks": totalMarks,
        "duration": duration,
        "pass_fail": passFail,
    };
}
