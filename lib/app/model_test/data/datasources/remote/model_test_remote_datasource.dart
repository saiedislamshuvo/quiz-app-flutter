import 'package:interview_task/app/model_test/data/models/model_test_result_model.dart';
import 'package:interview_task/core/errors/exceptions.dart';
import 'package:interview_task/app/model_test/data/models/model_test_question_model.dart';
import 'package:interview_task/app/model_test/data/models/model_test_model.dart';

abstract class ModelTestRemoteDataSource {
  /// Calls endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ModelTestModel>> getModelTestList();
  Future<List<ModelTestQuestionModel>> getModelTestQuestion(int modelTestId);
  Future<List<ModelTestResultModel>> getModelTestResult(int? modelTestId, int? studentId);
  Future<bool> postModelTestResult(Map<String, dynamic> data);
}