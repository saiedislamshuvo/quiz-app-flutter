import 'package:interview_task/app/model_test/data/models/model_test_model.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_question_entity.dart';

class ModelTestQuestionModel extends ModelTestQuestionEntity {
  final int id;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String? option5;
  final String correctAnswer;
  final ModelTestModel? modelTest;

    ModelTestQuestionModel({
      required this.id,
      required this.question,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4,
      this.option5,
      required this.correctAnswer,
      this.modelTest,
    }) : super(
      id: id,
      question: question,
      option1: option1,
      option2: option2,
      option3: option3,
      option4: option4,
      option5: option5,
      correctAnswer: correctAnswer,
      modelTest: modelTest
    );

    factory ModelTestQuestionModel.fromJson(Map<String, dynamic> json) => ModelTestQuestionModel(
        id: json["id"],
        question: json["question"],
        option1: json["option_1"],
        option2: json["option_2"],
        option3: json["option_3"],
        option4: json["option_4"],
        option5: json["option_5"],
        correctAnswer: json["correct_answer"],
        modelTest: ModelTestModel.fromJson(json["model_test"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "option_1": option1,
        "option_2": option2,
        "option_3": option3,
        "option_4": option4,
        "option_5": option5,
        "correct_answer": correctAnswer,
        "model_test": modelTest?.toJson(),
    };
}