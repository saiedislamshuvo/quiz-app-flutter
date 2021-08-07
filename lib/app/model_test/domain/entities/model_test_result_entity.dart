import 'package:equatable/equatable.dart';

class ModelTestResultEntity extends Equatable {
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

  ModelTestResultEntity({
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
  });

  @override
  List<Object?> get props => [
    id,
    studentFullName,
    studentId,
    modelTest,
    totalQuestionAttended,
    totalRightAnswer,
    totalWrongAnswer,
    totalNegativeMarks,
    totalMarks,
    duration,
    passFail,
  ];
}
