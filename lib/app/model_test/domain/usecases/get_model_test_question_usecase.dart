import 'package:dartz/dartz.dart';
import 'package:interview_task/app/model_test/domain/entities/model_test_question_entity.dart';
import 'package:interview_task/app/model_test/domain/repositories/model_test_repository.dart';
import 'package:interview_task/core/errors/failures.dart';
import 'package:interview_task/core/usecases/usecase.dart';

class GetModelTestQuestionUsecase implements UseCase<ModelTestQuestionEntity, int> {
  final ModelTestRepository repository;

  GetModelTestQuestionUsecase(this.repository);

  @override
  Future<Either<Failure, List<ModelTestQuestionEntity>>> call(params) async {
    return await repository.getModelTestQuestion(params);
  }
}