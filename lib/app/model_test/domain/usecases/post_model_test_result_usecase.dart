import 'package:dartz/dartz.dart';
import 'package:interview_task/app/model_test/domain/repositories/model_test_repository.dart';
import 'package:interview_task/core/errors/failures.dart';
import 'package:interview_task/core/usecases/usecase.dart';

class PostModelTestResultUsecase implements UseCaseSingle<bool, Map<String, dynamic>> {
  final ModelTestRepository repository;

  PostModelTestResultUsecase(this.repository);

  @override
  Future<Either<Failure, bool>> call(Map<String, dynamic> params) async {
    return await repository.postModelTestResult(params);
  }
}