import 'package:dartz/dartz.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_question_entity.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_result_entity.dart';
import 'package:interview_task/core/errors/failures.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_entity.dart';

abstract class ModelTestRepository {
  Future<Either<Failure, List<ModelTestEntity>>> getModelTestList();
  Future<Either<Failure, List<ModelTestQuestionEntity>>> getModelTestQuestion(int modelTestId);
  Future<Either<Failure, List<ModelTestResultEntity>>> getModelTestResult(int? modelTestId, int? studentId);
  Future<Either<Failure, bool>> postModelTestResult(Map<String, dynamic> data);
}