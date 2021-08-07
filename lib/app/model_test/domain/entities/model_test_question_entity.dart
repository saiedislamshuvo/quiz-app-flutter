import 'package:equatable/equatable.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';

class ModelTestQuestionEntity extends Equatable {
  final int id;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String? option5;
  final String correctAnswer;
  final ModelTestEntity? modelTest;
  
  ModelTestQuestionEntity({
      required this.id,
      required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      this.option5,
      required this.correctAnswer,
      this.modelTest,
  });

  @override
  List<Object?> get props => [
    id,
    question,
    option1,
    option2,
    option3,
    option4,
    option5,
    correctAnswer,
    modelTest,
  ];
}