import 'package:equatable/equatable.dart';

class ModelTestEntity extends Equatable {
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

  ModelTestEntity({
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
  });

  @override
  List<Object> get props => [
    url,
    id,
    title,
    shortDescription,
    examStartDateTime,
    examEndDateTime,
    examResultDateTime,
    examResultEndDateTime,
    coverImage,
    negativeMarks,
    subscription,
    examTime,
    passMarks,
    status,
  ];
 
}
