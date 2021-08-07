import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';

class ModelTestModel extends ModelTestEntity {
  final String url;
  final int id;
  final String title;
  final String shortDescription;
  final DateTime examStartDateTime;
  final DateTime examEndDateTime;
  final DateTime examResultDateTime;
  final DateTime examResultEndDateTime;
  final String coverImage;
  final double negativeMarks;
  final String subscription;
  final int examTime;
  final double passMarks;
  final String status;
  
  ModelTestModel({
    required this.url,
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.examStartDateTime,
    required this.examEndDateTime,
    required this.examResultDateTime,
    required this.examResultEndDateTime,
    required this.coverImage,
    required this.negativeMarks,
    required this.subscription,
    required this.examTime,
    required this.passMarks,
    required this.status,
  }) : super(
    url: url,
    id: id,
    title: title,
    shortDescription: shortDescription,
    examStartDateTime: examStartDateTime,
    examEndDateTime: examEndDateTime,
    examResultDateTime: examResultDateTime,
    examResultEndDateTime: examResultEndDateTime,
    coverImage: coverImage,
    negativeMarks: negativeMarks,
    subscription: subscription,
    examTime: examTime,
    passMarks: passMarks,
    status: status,
  );

  factory ModelTestModel.fromJson(Map<String, dynamic> json) => ModelTestModel(
    url: json["url"],
    id: json["id"],
    title: json["title"],
    shortDescription: json["short_description"],
    examStartDateTime: DateTime.parse(json["exam_start_date_time"]),
    examEndDateTime: DateTime.parse(json["exam_end_date_time"]),
    examResultDateTime: DateTime.parse(json["exam_result_date_time"]),
    examResultEndDateTime: DateTime.parse(json["exam_result_end_date_time"]),
    coverImage: json["cover_image"],
    negativeMarks: json["negative_marks"].toDouble(),
    subscription: json["subscription"],
    examTime: json["exam_time"],
    passMarks: json["pass_marks"].toDouble(),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "id": id,
    "title": title,
    "short_description": shortDescription,
    "exam_start_date_time": examStartDateTime.toIso8601String(),
    "exam_end_date_time": examEndDateTime.toIso8601String(),
    "exam_result_date_time": examResultDateTime.toIso8601String(),
    "exam_result_end_date_time": examResultEndDateTime.toIso8601String(),
    "cover_image": coverImage,
    "negative_marks": negativeMarks,
    "subscription": subscription,
    "exam_time": examTime,
    "pass_marks": passMarks,
    "status": status,
  };
}