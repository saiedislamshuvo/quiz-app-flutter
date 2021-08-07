import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:interview_task/app/model_test/data/datasources/remote/model_test_remote_datasource.dart';
import 'package:interview_task/app/model_test/data/models/model_test_model.dart';
import 'package:interview_task/app/model_test/data/models/model_test_question_model.dart';
import 'package:interview_task/app/model_test/data/models/model_test_result_model.dart';
import 'package:interview_task/core/apis/api.dart';
import 'package:interview_task/core/errors/exceptions.dart';

class ModelTestRemoteDataSourceImpl implements ModelTestRemoteDataSource {
  final http.Client client;

  ModelTestRemoteDataSourceImpl({required this.client});


  @override
  Future<List<ModelTestModel>> getModelTestList() => _getModelTestApiCall(Api.getMcqModelTestApi);

  Future<List<ModelTestModel>> _getModelTestApiCall(String url) async {
    final response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return List<ModelTestModel>.from(
        json.decode(utf8.decode(response.bodyBytes)).map((x) => ModelTestModel.fromJson(x))
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ModelTestQuestionModel>> getModelTestQuestion(int modelTestId) async {
    // http://165.22.196.82:8080/api/v1/question-bank/?model_test=4
    String uri = "${Api.getMcqQuestionBankApi}?model_test=${modelTestId}";
    print(uri);
    final response = await client.get(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return List<ModelTestQuestionModel>.from(
        json.decode(utf8.decode(response.bodyBytes)).map((x) => ModelTestQuestionModel.fromJson(x))
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ModelTestResultModel>> getModelTestResult(int? modelTestId, int? studentId) async {
    // http://165.22.196.82:8080/api/v1/mcq-exam-result-get/?student_id=01913&model_test=1
    String uri = "${Api.getMcqExamResultApi}?student_id=${studentId??''}&model_test=${modelTestId??''}";
    print(uri);
    final response = await client.get(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return List<ModelTestResultModel>.from(
        json.decode(utf8.decode(response.bodyBytes)).map((x) => ModelTestResultModel.fromJson(x))
      );
    } else {
      throw ServerException();
    }
  }
}
